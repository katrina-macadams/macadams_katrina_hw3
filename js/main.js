const app = Vue.createApp({
  created() {
    // Fetch cards data from the API
    fetch('http://localhost:8888/macadams_katrina_lumenvue/public/index.php/cards')
      .then(res => res.json())
      .then(data => {
        this.cardsData = data; 
        this.loadingCards = false;

        this.$nextTick(() => {
          gsap.from(".card", {
            y: -50, 
            opacity: 0, 
            duration: 1, 
            stagger: 0.3, 
            ease: "power3.out",
          });

          gsap.fromTo(
            ".main-title",
            { opacity: 0 },
            {
              opacity: 1,
              duration: 2,
              onComplete: () => {
                gsap.to(".main-title", {
                  duration: 2,
                  scrambleText: {
                    text: "Welcome to the World of Tarot",
                    chars: "⛤₊☽⋆◯⛧☾𖤓",
                    revealDelay: 0.8,
                  },
                });
              },
            }
          );
        });
      })
      
      .catch(error => {
        console.error(error);
        this.loadingCards = false;
      });
  },
  data() {
    return {
      cardsData: [], 
      loadingCards: true, 
      activeCard: null, 
    };
  },
  methods: {
    toggleOverlay(index) {
      this.activeCard = this.activeCard === index ? null : index;
    },
    flipCard(index) {
      this.cardsData[index].isFlipped = !this.cardsData[index].isFlipped;
  },
  
},
}).mount('#app');