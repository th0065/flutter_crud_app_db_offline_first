import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../provider/bien_provider.dart';
import 'bien_add_screen.dart';

class BienListScreen extends StatelessWidget {
  // Méthode pour vérifier la connexion Internet
  Future<bool> isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des biens'),
        actions: [
          // Bouton de synchronisation
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () async {
              final bienProvider = Provider.of<BienProvider>(context, listen: false);

              // Vérifier la connexion Internet
              if (await isConnected()) {
                try {
                  // Synchroniser les données avec le backend
                  await bienProvider.loadBiens();

                  // Afficher un message de succès
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Synchronisation terminée'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (e) {
                  // Afficher un message d'erreur en cas d'échec
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erreur lors de la synchronisation: $e'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              } else {
                // Afficher un message si hors ligne
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pas de connexion Internet'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<BienProvider>(
        builder: (context, bienProvider, child) {
          // Afficher la liste des biens
          return ListView.builder(
            itemCount: bienProvider.biens.length,
            itemBuilder: (context, index) {
              final bien = bienProvider.biens[index];
              return ListTile(
                title: Text(bien.titre),
                subtitle: Text(bien.description),
                trailing: Text('${bien.prix} €'),
              );
            },
          );
        },
      ),
      // Bouton pour ajouter un nouveau bien
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BienAddScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}