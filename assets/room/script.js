var html = `
<table style="width:100%; height:100%;">

<tr>
<td style="font-size: 150%; font-weight: 600">ROOM NAME</td>
</tr>




</table>
`;

function myFunction() {

    var y=1;
    while (y<howManyCards+1)
    {
        document.getElementById("scrolling-wrapper").appendChild(createElementFromHTML('<div class="card" id="'+y.toString()+'"></div>'));
        y++;
    }


    var x=1; //x is the ID of the card
    while (x<howManyCards+1) //this is the number of courses + 1
    {
        html=html.replace(roomNames[x-1],roomNames[x]);

        document.getElementById(x.toString()).innerHTML = html;
        x++;
    }
    
}

function createElementFromHTML(htmlString) {
    var div = document.createElement('div');
    div.innerHTML = htmlString.trim();
  
    // Change this to div.childNodes to support multiple top-level nodes
    return div.firstChild; 
  }
