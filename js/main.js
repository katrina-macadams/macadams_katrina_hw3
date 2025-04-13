const app = Vue.createApp({
  created() {
    // Fetch cards data from the API
    fetch('http://localhost:8888/tarot-final-example/public/index.php/cards')
      .then(res => res.json())
      .then(data => {
        this.cardsData = data; // Populate cardsData with the fetched data
        this.loadingCards = false; // Hide the loader
      })
      .catch(error => {
        console.error(error);
        this.loadingCards = false; // Hide the loader even if there's an error
      });
  },
  data() {
    return {
      cardsData: [], // Array to hold the cards data
      loadingCards: true, // Show loader while fetching data
      activeCard: null, // Track the index of the active card
    };
  },
  methods: {
    toggleOverlay(index) {
      // Toggle the active card
      this.activeCard = this.activeCard === index ? null : index;
    },
  },
}).mount('#app');