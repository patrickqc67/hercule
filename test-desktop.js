// Test simple pour vérifier que l'application desktop peut se lancer
const { app, BrowserWindow } = require('electron');

let testWindow;

function createTestWindow() {
  testWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true
    },
    show: false
  });

  // Charger une page de test simple
  testWindow.loadURL('data:text/html,<h1>CodePhantom Desktop Test</h1><p>Application fonctionnelle !</p>');
  
  testWindow.once('ready-to-show', () => {
    testWindow.show();
    console.log('✅ Test desktop réussi - Application fonctionnelle');
    
    // Fermer après 3 secondes
    setTimeout(() => {
      testWindow.close();
      app.quit();
    }, 3000);
  });

  testWindow.on('closed', () => {
    testWindow = null;
  });
}

app.whenReady().then(() => {
  createTestWindow();
});

app.on('window-all-closed', () => {
  app.quit();
});