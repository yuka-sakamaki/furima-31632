if (location.pathname.match("items/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("input-tag");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("input-tag").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        console.log(XHR.response);
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          console.log(tagName)
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("input-tag").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};