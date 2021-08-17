import places from 'places.js';

const initAutocomplete = () => {
    const addressInput = document.getElementById('patrimonio_ubicacion');
    if (addressInput) {
        places({ container: addressInput,
                        type: "address",
                        countries: 'cl',
                        language: 'es' });
    }
};

export { initAutocomplete };