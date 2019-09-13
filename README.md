# Responsive Widgets

Foram criados 5 widgets na pasta "responsive_widgets":

###### ContainerResponsive
- `ContainerResponsive(`<br>
`    	child: ,`<br>
`    	height: ,` // double Responsive wight<br>
`    	heightResponsive: ,` // bool Enable/Disable Responsive height<br>
`    	width: ,` // double Responsive width<br>
`    	widthResponsive: ,` // bool Enable/Disable Responsive width<br>
`    )`<br>

###### EdgeInsetsResponsive (Can be used in any widget with padding)
- `Padding(`<br>
`    	child: ,`<br>
`    	padding: EdgeInsetsResponsive.all(50),` // EdgeInsets Responsive padding<br>
`    )`<br>

###### IconResponsive
- `IconResponsive(`<br>
`    	icon`<br>
`    	size: double, `// Responsive size<br>
`    )`<br>

###### IconButtonResponsive
- `IconButtonResponsive(`<br>
`    	icon`<br>
`    	size: double,` // Responsive size<br>
`    )`<br>

###### TextResponsive
- `TextResponsive(`<br>
`    	text` // Responsive fontSize<br>
`    )`<br>

### Função para recalcular tamanho responsivelmente
Existem casos especiais que não possuem Widgets Responsivos criados, um caso disso é o Positioned, para resolver o problema é apenas colocar essa função `getSizeByDp(double size)` que retornará o valor correto para a tela.

## Examples

###### ContainerResponsive
[![Container responsive and EdgeInsets](https://imgur.com/uW9XCo8.jpg "Container responsive and EdgeInsets")](https://imgur.com/uW9XCo8.jpg "Container responsive and EdgeInsets")

###### IconResponsive
[![IconResponsive](https://imgur.com/v4tilae.jpg "IconResponsive")](https://imgur.com/v4tilae.jpg "IconResponsive")

###### TextResponsive
[![TextResponsive](https://imgur.com/kD2TTf7.jpg "TextResponsive")](https://imgur.com/kD2TTf7.jpg "TextResponsive")

###### getSizeByDp(size)
[![Function getSizeByDp](https://i.imgur.com/4p6hShM.jpg "Function getSizeByDp")](https://i.imgur.com/4p6hShM.jpg "Function getSizeByDp")
