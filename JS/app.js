// Import the functions you need from the SDKs you need

import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
import { getFirestore, addDoc, collection, doc, getDocs, } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDN9ng0Gu6iJ4QEkuRWngiSS-vjNkmqzMU",
    authDomain: "crud-10925.firebaseapp.com",
    projectId: "crud-10925",
    storageBucket: "crud-10925.appspot.com",
    messagingSenderId: "761943336653",
    appId: "1:761943336653:web:cd34839ccce5df2ce4ab84",
    measurementId: "G-R66ZV5L8QB"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

const db = getFirestore(app);
// const petRef = collection(db, 'pet')
const obtenerMascotas = ()=> getDocs(collection(db, 'pet'))


const pintarDatos = document.getElementById('tabla');
const registerForm = document.getElementById('registerForm')
const openModal = document.getElementById('openRegisterModal');
const closeModal = document.getElementById('closeRegisterModal');
const modal = document.getElementById('modal');
const showRegistrerModal = () => {
    modal.classList.toggle('is-active');
}

openModal.addEventListener('click', showRegistrerModal);
closeModal.addEventListener('click', showRegistrerModal);

window.addEventListener('DOMContentLoaded',  async () => {
    const querySnapshot = await obtenerMascotas();
    querySnapshot.forEach(doc => {
        console.log(doc.data().FirstAp);
        pintarDatos.innerHTML += `<tr>
        <th></th>
        <td>${doc.data().nombre}</td>
        <td>${doc.data().FirstAp}</td>
        <td>${doc.data().SecAp}</td>
        <td>${doc.data().tel}</td>
        <td>${doc.data().email}</td>
        <td>
            <button class="button is-warning" data-id= "${doc.id}">Edit</button>
            <button class="button is-danger"  data-id= "${doc.id}">Delete</button>
        </td>
    </tr>`

    })
   

})
const crearFila = (doc) => {
    return `
    <tbody>
        
    </tbody>`;
}



registerForm.addEventListener('submit', async (e) => {
    e.stopPropagation()
    e.preventDefault()

    const nombre = registerForm['name'].value;
    const FirstAp = registerForm['apePat'].value;
    const SecAp = registerForm['apeMat'].value;
    const tel = registerForm['tel'].value;
    const email = registerForm['email'].value;
    const desp = registerForm['desp'].value


    try {
        const docRef = await addDoc(collection(db, "pet"), {
            nombre: nombre,
            FirstAp: FirstAp,
            SecAp: SecAp,
            tel: tel,
            email: email,
            desp: desp
        });

        console.log("Document written with ID: ", docRef.id);
    } catch (e) {
        console.error("Error adding document: ", e);
    }
    showRegistrerModal()
    crearFila(registerForm)

})
