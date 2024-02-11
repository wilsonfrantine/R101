// script.js
document.addEventListener("DOMContentLoaded", function() {
    let exerciseCards = document.querySelectorAll(".exercise-card");

    exerciseCards.forEach(function(card) {
        card.addEventListener("mouseenter", function() {
            card.style.backgroundColor = "#f5f5f5";
        });

        card.addEventListener("mouseleave", function() {
            card.style.backgroundColor = "#fff";
        });
    });
});
