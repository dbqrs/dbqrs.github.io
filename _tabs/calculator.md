---
# the default layout is 'page'
icon: fas fa-sharp fa-calculator
order: 5
---

<html>
<head>
	<title>WRC Dipole Calc</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		body {
			background-color: #f2f2f2;
		}
		form {
			background-color: #ffffff;
			border: 2px solid #333333;
			border-radius: 10px;
			margin: 10px auto;
			max-width: 800px;
			padding: 20px;
			text-align: center;
            float: left;
			margin-right: 20px;
		}
		label {
			display: block;
			margin: 10px 0;
			text-align: left;
		}
		input[type="number"], select {
			border-radius: 5px;
			border: 1px solid #cccccc;
			padding: 10px;
			width: 100%;
		}
		button {
			background-color: #333333;
			border: none;
			border-radius: 5px;
			color: #ffffff;
			cursor: pointer;
			margin-top: 10px;
			padding: 10px;
			width: 200px;
		}
		input[type="text"] {
			border-radius: 5px;
			border: 1px solid #cccccc;
			margin-top: 10px;
			padding: 10px;
			text-align: center;
			max-width: 600px;
		}
		label[for="frequency"] {
			display: inline-block;
			width: 150px;
			text-align: right;
			margin-right: 10px;
		}

		#frequency {
			display: inline-block;
			width: 100px;
		}

	</style>
</head>
<body>
		<h3>Experimental Vertical Dipole Calc for WRC SB1000</h3>


	<!-- The form that will trigger the calculate() function -->
	<form>
		<center>
			<label for="frequency">Frequency (MHz)</label>
			<input type="text" id="frequency" name="frequency" pattern="[0-9]+(\.[0-9]{1,3})?" required oninput="calculate()">
		</center>
		<!-- The output fields that will display the results -->
		<center>
			<label style="display:inline-block;width:150px;text-align:center" for="dipole-length">Dipole Length</label>
			<input type="text" id="dipole-length" name="dipole-length" readonly><br>

			<label style="display:inline-block;width:150px;text-align:center" for="ground-radial-length">Radial Length</label>
			<input type="text" id="ground-radial-length" name="ground-radial-length" readonly><br>

			<label style="display:inline-block;width:150px;text-align:center" for="number-of-radials">Number of Radials</label>
			<input type="text" id="number-of-radials" name="number-of-radials" readonly><br>
       
			<!-- The output section to display any errors or messages -->
			<div id="output"></div>

		</center>
	</form>

	<!-- The JavaScript section to handle form submission and calculation -->
<script>
function calculate() {
    // Get user input
    let frequency = parseFloat(document.getElementById("frequency").value);

    // Constants
    const SPEED_OF_LIGHT = 984.2519685; // Speed of light in feet per microsecond
    const IMPEDANCE_OF_FREE_SPACE = 377; // Impedance of free space in ohms
    const PI = 3.14159265358979323846; // Pi constant

    // Calculate wavelength in feet
    let wavelength = SPEED_OF_LIGHT / frequency;

    // Calculate optimal dipole length in feet
    let dipoleLength = wavelength / 2;

    // Calculate ground radial length in feet
    let groundRadialLength = wavelength / (2 * PI);

    // Calculate number of radials
    let numberOfRadials;
        if (frequency <= 16) {
            numberOfRadials = 16;
        } else {
            numberOfRadials = 32;
        }

    // Output the results 
    document.getElementById("dipole-length").value = dipoleLength.toFixed(3) + " ft";
    document.getElementById("ground-radial-length").value = groundRadialLength.toFixed(3) + " ft";
    document.getElementById("number-of-radials").value = Math.round(numberOfRadials) + " radials";

    // Clear any previous error messages
    document.getElementById("output").innerHTML = "";

    // Check for errors and display messages
    if (isNaN(frequency)) {
        document.getElementById("output").innerHTML = "Error: Please enter a valid frequency.";
    } else {
        document.getElementById("output").innerHTML = "Calculation complete.";
    }
}
</script>

</body>
</html>
