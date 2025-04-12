const app = Vue.createApp({
    created() {
        // Ideal to get your remote data during the created phase
        fetch('http://localhost:8888/tarot/public/cards')
            .then(res => res.json())
            .then(data => {
              this.cardsData = data
              this.loadingCards = false
            })
            .catch(error => console.error(error));
    },
    data() {
        return {
            cardsData: [],
            title: "",
            poster: "",
            upright: "",
            reversed: "",
            error: "",
            loading: false,
            loadingCards: true,
        }
    },

    methods: {
      getCard(id) {
        console.log(id)
        this.loading = true;
        this.error = false;
        const cardInfoCon = document.querySelector("#cardInfoCon");

        fetch(`http://localhost:8888/cardstore-api/public/cards/${id}`)
            .then(res => res.json())
            .then(data => {
              if (data.length > 0) {
              console.log(data[0]);  
              const cardData = data[0];
              this.loading = false; 
              const cardInfoCon = document.querySelector("#cardInfoCon");          
              // This is using the ternary operator (condition ? value_if_true : value_if_false), which is a shorthand for an if-else statement.
              this.name = cardData.name ? cardData.name : 'Not available';
              this.poster = cardData.poster ? cardData_poster : 'Not available';
              this.upright = cardData.upright ? cardData.upright : 'Not available';
              this.reversed = cardData.card_reversed ? cardData.card.reversed : 'Not available';
              } else {
                this.loading = false;
                this.error = 'No card found with the given query';
              }
          }).then(() => {
            cardInfoCon.scrollIntoView({ behavior: 'smooth', block: 'end' });
        })
          .catch(error => console.error(error));
      }
    }
}).mount('#app');