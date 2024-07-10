#import "assignment.typ": assignment, note, todo


// Latex font
//#set text(font: "New Computer Modern")
//#show raw: set text(font: "New Computer Modern Mono")

#set text(font: "Times New Roman")
#show raw: set text(font: "Times New Roman")

#show: assignment

#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#show par: set block(spacing: 0.55em)
#set page(margin: 1.75in)
#show heading: set block(above: 1.4em, below: 1em)

= Introduction
#lorem(60)
#note[This is an important note about the assignment.]

= Implementation
#lorem(60)
Explain your methodology here.
== Sub header 1
#lorem(60)
#todo[Add
    more details about the data collection process.]
== Sub header 2
#lorem(60)
#todo[Add more details about the data collection process.]
=== Sub sub header
#lorem(60)

= Results
#lorem(60)
Present your results here.

= Discussion
#lorem(60)
#lorem(60)
Discuss your findings here.

= Conclusion
#lorem(60)
Summarize your conclusions here.

