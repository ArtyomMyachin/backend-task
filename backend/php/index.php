<?php header('Content-Type: text/html; charset=utf-8');
$text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magnam omnis voluptatem mollitia quisquam nam voluptate eius commodi iste, aliquid facilis nulla a quo reiciendis laborum fugiat laboriosam voluptatibus, laudantium neque quis suscipit exercitationem. Voluptas dicta eveniet excepturi accusantium illo natus fuga aliquam doloremque cum debitis suscipit incidunt minima quisquam non ad repellendus odio voluptate, eos ipsam! Dolorem, id? Voluptate magnam rerum harum, labore facere accusantium aliquid quas architecto porro. Nostrum, veritatis cupiditate facere blanditiis rerum voluptas perferendis expedita! Modi aut, debitis at minus voluptatibus, expedita officia impedit vel quod vitae hic fuga, saepe odio. Assumenda harum, obcaecati doloribus eaque sapiente.";?>
<!DOCTYPE html>
<html>
	<head>
		<title>PHP task</title>
		<style type="text/css">
			.red-text {
				color: red;
				font: bolder sans-serif;
			}
			#main {
				margin: 50px auto;
				width: 900px;
			}
		</style>
	</head>
	<body>
		<section id="main">
			<form method="post" action="index.php">
				<h1>Найти строку в тексте</h1>
				Ключевая строка: <input type="text" name="search" id="search"/>
				<br/><br/>
				<input type="submit" value="Поиск"/><br/>
				<hr width="100%"/>
				<?php
					if($_POST["search"] != "")
					{
						$query = $_POST["search"];
						$word = "";
						$words = array();
						$was_quote = false;
						foreach(str_split($query) as $symbol)
						{
							if((($symbol != ' ') || ($was_quote)) && ($symbol != '\\') && ($symbol != '"'))
							{
								$word .= $symbol;
							}
							elseif($symbol == '"')
							{
								continue;
							}
							elseif(($symbol == ' ') && (!$was_quote) && ($word != "") || ($was_quote))
							{
								$words[] = $word;
								$word = "";
								$was_quote = false;
							}
							elseif($symbol == '\\')
							{
								$was_quote = true;
							}
						}
						if($word != "")
						{
							$words[] = $word;
						}
						foreach($words as $e)
						{
							$pattern = "/".$e."/";
							$replacement = "<span class='red-text'>".$e."</span>";
							$text = preg_replace($pattern, $replacement, $text);
						}
					}
					echo $text;
				?>
			</form>
		</section>
	</body>
</html>