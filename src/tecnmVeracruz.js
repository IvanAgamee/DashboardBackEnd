var app = require("./app");
const PORT = 3010;

async function main() {
    await app.listen(PORT, err => {
        if (err) {
            // Aquí manejar el error
            console.error("Error: ", err);
            return;
        }
        // Si no se detuvo arriba con el return, entonces todo va bien ;)
        console.log(`Server on port: ${PORT}`);
    });
}

main();