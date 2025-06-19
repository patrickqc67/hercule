import path from "path";
import fs from "fs";
import express from "express";

export function serveStatic(app: express.Express) {
  const staticPath = path.resolve(__dirname, "dist/public");

  if (!fs.existsSync(staticPath)) {
    throw new Error("❌ Le dossier Vite 'dist/public' est introuvable. Lance 'npm run build'.");
  }

  app.use(express.static(staticPath));

  app.get("*", (_req, res) => {
    res.sendFile(path.join(staticPath, "index.html"));
  });
}