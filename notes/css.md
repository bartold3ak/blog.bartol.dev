% css

## keep footer at the bottom

html:

	<body>
		<header>...</header>
		<main>...</main>
		<footer>...</footer>
	</body>

css:

	body {
		min-height: 100vh;
		display: grid;
		grid-template-rows: auto 1fr auto;
	}

## CSS system font stack

	font-family: system-ui, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;

## Remove underline from link

	a {
		text-decoration: none;
	}

get it back on hover:

	a:hover {
		text-decoration: underline;
	}
