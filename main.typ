#import "assignment.typ": assignment, note, todo


#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")

// Might need sometimes
//#set text(font: "Times New Roman")
//#show raw: set text(font: "New Computer Modern")

#show: assignment


#set align(left)
#set text(size: 12pt)
#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#show par: set block(spacing: 0.55em)
#set page(margin: 1.75in)
#show heading: set block(above: 1.4em, below: 1em)

// start page numbering after
// first page and table of content
#set page(numbering: "1",number-align: center)
#counter(page).update(1)

= Introduction
#lorem(60)
#note[This is an important note about the assignment.]

= Implementation
#lorem(60)

== Sub header 1
#lorem(60)
#todo[Add more details about the data collection process.]

== Sub header 2
#lorem(60)
#todo[Add more details about the data collection process.]

=== Sub sub header
#lorem(60)

= Results
#lorem(60)

= Discussion
#lorem(60)

#lorem(60)

= Conclusion
#lorem(60)
