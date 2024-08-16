#let notes() = doc => {
  set text(font: "New Computer Modern")
  doc
}

#let unipd-doc(title: none, subtitle: none, author1: none, author2: none, author3: none, date: none) = doc => {
  let unipd-red = rgb(180, 27, 33)
  set page(header: [
  _ITSM Project - Dissertation Document_
  #h(1fr)
], footer: [
  _IT Service Management 2023-2024_
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
])
  set list(marker: ([•], [◦], [--]))
  set heading(numbering: "1.1.")
  show heading.where(level: 1): it => {
    set text(fill: unipd-red)
    it
  }
  align(center, {
    v(10em)
    figure(image("images/unipd-logo.png", width: 40%))
    v(3em)
    text(size: 22pt, weight: "bold", fill: unipd-red, smallcaps(title))
    v(5pt)
    text(size: 18pt, weight: "bold", fill: unipd-red, subtitle)
    parbreak()
    set text(size: 15pt)
    author1
    author2
    author3
    parbreak()
    date
    pagebreak()
  })
  show outline: set heading(outlined: true)
  show outline.entry.where(level: 1): it => {
    v(1em, weak: true)
    strong(it)
  }
  outline(
    title: "Table of contents",
    indent: 2em,
  )
  pagebreak()
  outline(title: "List of Figures", target: figure.where(kind: image))
  outline(title: "List of Tables", target: figure.where(kind: table))
  pagebreak()
  doc
}