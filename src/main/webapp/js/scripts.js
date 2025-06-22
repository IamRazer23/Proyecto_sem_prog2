// Ejemplo de validación al enviar formulario
document.addEventListener("DOMContentLoaded", function() {
    const forms = document.querySelectorAll("form");
    forms.forEach(form => {
        form.addEventListener("submit", function(e) {
            const inputs = form.querySelectorAll("input[required]");
            let valid = true;
            inputs.forEach(input => {
                if (!input.value.trim()) {
                    alert("Todos los campos son obligatorios.");
                    valid = false;
                }
            });
            if (!valid) e.preventDefault();
        });
    });
});
