const pay = () => {
  Payjp.setPublicKey("pk_test_fe8e58de335617f1e4396959");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_year: `20${formData.get("exp_year")}`,
      exp_month: formData.get("exp_month"),
    };

    console.log(card);

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const token0bj = `<input value=${token} type="hidden" name='token' >`;
        renderDom.insertAdjacentHTML("beforeend", token0bj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);
