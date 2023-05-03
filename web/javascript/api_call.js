
const axios = require('axios');

async function get_data() {
    let res = await axios.get("http://checkip.dyndns.org");
    let data = res.data;

    console.log(data);
    console.log(typeof(data));
}

get_data()

/*
axios.get("http://checkip.dyndns.org")
    .then(response => {
        console.log(response.data);
    });
*/