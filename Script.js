<script>

var selectedDiv;
var enableTabs = {enableTabs};


/* Select a "tab" 
if (enableTabs)
	buttonBarClick(document.getElementById("Management"), "Management"); 
*/

function buttonBarClick(div, id, link) {

        $("[name='MenuActionName']").SFCTextBox('option', 'text', id);
        if (link)
              $("[name='MenuActionLink']").SFCTextBox('option', 'text', link);
        else
              $("[name='MenuActionLink']").SFCTextBox('option', 'text', '');


	document.getElementsByName("MenuActionButton")[0].click();

	if (enableTabs) {
		
		if (selectedDiv)
		{
			selectedDiv.classList.remove("divButton_selected");
		}
		selectedDiv = div;			
		div.classList.add("divButton_selected");
	}
}

</script>
