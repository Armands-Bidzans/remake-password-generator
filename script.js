 // script.js
'use strict';var lengthInput=document.getElementById("length");
const special=document.getElementById("special"),number=document.getElementById("number"),password=document.getElementById("password"),localizedStrings={en:{invalidLength:"Password length must be a valid number greater than or equal to 6",copyNotSupported:"Your browser doesn't support copying to clipboard.",copySuccess:"Password copied successfully!",copyError:"Error copying password. Please try again."},ru:{invalidLength:"\u0414\u043b\u0438\u043d\u0430 \u043f\u0430\u0440\u043e\u043b\u044f \u0434\u043e\u043b\u0436\u043d\u0430 \u0431\u044b\u0442\u044c \u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u043c \u0447\u0438\u0441\u043b\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u0435 \u0438\u043b\u0438 \u0440\u0430\u0432\u043d\u0430 6",copyNotSupported:"\u0412\u0430\u0448 \u0431\u0440\u0430\u0443\u0437\u0435\u0440 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435 \u0432 \u0431\u0443\u0444\u0435\u0440 \u043e\u0431\u043c\u0435\u043d\u0430.",
copySuccess:"\u041f\u0430\u0440\u043e\u043b\u044c \u0443\u0441\u043f\u0435\u0448\u043d\u043e \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d!",copyError:"\u041e\u0448\u0438\u0431\u043a\u0430 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u043f\u0430\u0440\u043e\u043b\u044f. \u041f\u043e\u0436\u0430\u043b\u0443\u0439\u0441\u0442\u0430, \u043f\u043e\u043f\u0440\u043e\u0431\u0443\u0439\u0442\u0435 \u0435\u0449\u0435 \u0440\u0430\u0437."},lv:{invalidLength:"Paroles garumam j\u0101b\u016bt der\u012bgam skaitlim, kas ir liel\u0101ks vai vien\u0101ds ar 6",
copyNotSupported:"J\u016bsu p\u0101rl\u016bkprogramma neatbalsta kop\u0113\u0161anu starpliktuv\u0113.",copySuccess:"Parole veiksm\u012bgi kop\u0113ta!",copyError:"K\u013c\u016bda kop\u0113jot paroli. L\u016bdzu, m\u0113\u0123iniet v\u0113lreiz."}};function getCurrentLanguage(){return document.documentElement.lang||"en"}
function generatePassword(){var a="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";special.checked&&(a+="!@#$%^&*()_+-=/~-=|?");number.checked&&(a+="0123456789");var c=parseInt(lengthInput.value),b=getCurrentLanguage();b=localizedStrings[b]||localizedStrings.en;if(isNaN(c)||c<6)alert(b.invalidLength),lengthInput.value="";else{b=[];for(var d=0;d<c;d++)b.push(a.charAt(Math.floor(Math.random()*a.length)));password.value=b.join("")}}
lengthInput.addEventListener("input",a=>{a.target.value=a.target.value.replace(/[^0-9]/g,"")||"";isNaN(parseInt(a.target.value))||generatePassword()});special.addEventListener("change",generatePassword);number.addEventListener("change",generatePassword);generatePassword();

 //password copying
 function copyPassword() {
// legacy code of copying password, unused because execCommand is deprecated and unsafe function copypassword(){var e=document.getElementById("password");e.select(),document.execCommand("copy")
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

 function toggleDarkMode(){document.body.classList.toggle("dark-mode")};

//code was optimized with google closure compiler advanced optimisation don't optimized version of this code(script1.js LEGACY): https://docs.google.com/document/d/1WNdmshSOURZioO_rDRfXJpq0KVfLRcQXm77GNknIa58/edit?usp=sharing//