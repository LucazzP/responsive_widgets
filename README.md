# Responsive Widgets

Foram criados 5 widgets na pasta "responsive_widgets":

###### ContainerResponsive
- `ContainerResponsive(`
`    	child: ,`
`    	height: ,` // double Responsive wight
`    	heightResponsive: ,` // bool Enable/Disable Responsive height
`    	width: ,` // double Responsive width
`    	widthResponsive: ,` // bool Enable/Disable Responsive width
`    )`

###### EdgeInsetsResponsive (Can be used in any widget with padding)
- `Padding(`
`    	child: ,`
`    	padding: EdgeInsetsResponsive.all(50),` // EdgeInsets Responsive padding
`    )`

###### IconResponsive
- `IconResponsive(`
`    	icon`
`    	size: double, `// Responsive size
`    )`

###### IconButtonResponsive
- `IconButtonResponsive(`
`    	icon`
`    	size: double,` // Responsive size
`    )`

###### TextResponsive
- `TextResponsive(`
`    	text` // Responsive fontSize
`    )`

### Função para recalcular tamanho responsivelmente
Existem casos especiais que não possuem Widgets Responsivos criados, um caso disso é o Positioned, para resolver o problema é apenas colocar essa função `getSizeByDp(size)` que retornará o valor correto para a tela.

## Examples

###### ContainerResponsive
[![Container responsive and EdgeInsets](https://imgur.com/uW9XCo8.jpg "Container responsive and EdgeInsets")](https://imgur.com/uW9XCo8.jpg "Container responsive and EdgeInsets")

###### IconResponsive
[![IconResponsive](https://imgur.com/v4tilae.jpg "IconResponsive")](https://imgur.com/v4tilae.jpg "IconResponsive")

###### TextResponsive
[![TextResponsive](https://imgur.com/kD2TTf7.jpg "TextResponsive")](https://imgur.com/kD2TTf7.jpg "TextResponsive")

###### getSizeByDp(size)
[![Function getSizeByDp](https://i.imgur.com/4p6hShM.jpg "Function getSizeByDp")](https://i.imgur.com/4p6hShM.jpg "Function getSizeByDp")