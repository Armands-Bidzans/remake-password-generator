'use strict';
var lengthInput = document.getElementById("length");
const special = document.getElementById("special"),
    number = document.getElementById("number"),
    password = document.getElementById("password"),
    localizedStrings = {
        en: {
            invalidLength: "Password length must be a valid number greater than or equal to 6",
            copyNotSupported: "Your browser doesn't support copying to clipboard.",
            copySuccess: "Password copied successfully!",
            copyError: "Error copying password. Please try again."
        },
        ru: {
            invalidLength: "Длина пароля должна быть корректным числом больше или равна 6",
            copyNotSupported: "Ваш браузер не поддерживает копирование в буфер обмена.",
            copySuccess: "Пароль успешно скопирован!",
            copyError: "Ошибка копирования пароля. Пожалуйста, попробуйте еще раз."
        },
        lv: {
            invalidLength: "Paroles garumam jābūt derīgam skaitlim, kas ir lielāks vai vienāds ar 6",
            copyNotSupported: "Jūsu pārlūkprogramma neatbalsta kopēšanu starpliktuvē.",
            copySuccess: "Parole veiksmīgi kopēta!",
            copyError: "Kļūda kopējot paroli. Lūdzu, mēģiniet vēlreiz."
        }
    };

function getCurrentLanguage() {
    return document.documentElement.lang || "en";
}

function generatePassword() {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    special.checked && (chars += "!@#$%^&*()_+-=/~-=|?");
    number.checked && (chars += "0123456789");

    const length = parseInt(lengthInput.value),
        lang = getCurrentLanguage(),
        strings = localizedStrings[lang] || localizedStrings.en;

    if (isNaN(length) || length < 6) {
        alert(strings.invalidLength);
        lengthInput.value = "";
        return;
    }

    let newPassword = [];
    for (let i = 0; i < length; i++) {
        newPassword.push(chars.charAt(Math.floor(Math.random() * chars.length)));
    }
    password.value = newPassword.join("");
}

lengthInput.addEventListener("input", e => {
    e.target.value = e.target.value.replace(/[^0-9]/g, "") || "";
    if (!isNaN(parseInt(e.target.value))) generatePassword();
});

special.addEventListener("change", generatePassword);
number.addEventListener("change", generatePassword);
generatePassword();







 function copyPassword() {
     const passwordText = password.value;
    const currentLang = getCurrentLanguage();
     const strings = localizedStrings[currentLang] || localizedStrings.en;

     if (!navigator.clipboard) {
         alert(strings.copyNotSupported);
         return;
     }
     navigator.clipboard.writeText(passwordText)
       .then(() => alert(strings.copySuccess))
       .catch(() => alert(strings.copyError));
 }
// legacy code of copying password, unused because execCommand is deprecated and unsafe function copypassword(){var e=document.getElementById("password");e.select(),document.execCommand("copy")
 function toggleDarkMode(){document.body.classList.toggle("dark-mode")};