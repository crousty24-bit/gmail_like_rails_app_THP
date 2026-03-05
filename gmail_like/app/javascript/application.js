// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
document.addEventListener("change", function(event) {
  // On vérifie si l'élément modifié possède bien notre attribut turbo_action
  if (event.target.dataset.turboAction === "update-email-read-status") {
    
    // On récupère l'ID de l'email et le nouvel état de la checkbox (cochée ou non)
    const emailId = event.target.dataset.turboEmailId;
    const isRead = event.target.checked;
    
    // On récupère le jeton de sécurité de Rails pour autoriser la requête
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    // On envoie la requête PATCH à notre contrôleur
    fetch(`/emails/${emailId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken,
        "Accept": "text/vnd.turbo-stream.html" // Très important pour que Rails réponde avec notre fichier turbo_stream !
      },
      body: JSON.stringify({ email: { read: isRead } })
    })
    // 1. On récupère la réponse du serveur au format texte
    .then(response => response.text())
    // 2. On transmet ce texte à Turbo pour qu'il exécute la mise à jour visuelle !
    .then(html => {
      Turbo.renderStreamMessage(html);
    });
  }
});