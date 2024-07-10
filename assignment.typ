#let standard_block(content, alignment: center, weight: "bold", size: 14pt) = {
  set align(alignment)
  set text(weight: weight, size: size)

  block(content)
}

#let spaced_block(content,space: 2em, alignment: center, weight: "bold", size: 14pt) = {
    standard_block(content, alignment: alignment, weight: weight, size: size)
    v(space)
}

#let image_block(path, width, margin: 2em) = {
  set align(center)

  v(margin)
  block(image(path, width: width))
  v(margin)
}

#let section(title:none, content, space: 1.5em) = {
    if title!= none{
        standard_block([#title])
    }
    standard_block(content)
    v(space)
}

#let render_university_info(info) = {
    let university = info.university

    standard_block(university.name)
    standard_block(university.department)
    standard_block(university.location)
    image_block(university.logo, 6cm, margin:1.5em)
 }

#let render_course_info(info)= {
    let course = info.course
    let activity = info.activity

    standard_block(course.code)
    standard_block(course.title)
    if "description" in activity {
        standard_block(activity.title)
        spaced_block(["#activity.description"])
    } else {
        spaced_block(activity.title)
    }

}

#let render_submission_details(info, current_date) = {
    let student = info.student
    let tutor = info.tutor

    standard_block("Submitted by")
    spaced_block([#student.name (#student.roll_no)])

    standard_block("Submitted to")
    standard_block(tutor.name)
    if "post" in tutor {
        standard_block(tutor.post)
    }
    spaced_block(tutor.department, space: 1.5em)

    standard_block("Submission Date")
    spaced_block(current_date)
}

#let assignment(body) = {
    let info = toml("config.toml")

    let current_date = if "date" in info {
        info.date
    } else {
        datetime.today().display("[month repr:long] [day], [year]")
    }

    set document(author: info.student.name, title: info.activity.title)
    set text(font: "Times New Roman", size: 11pt, lang: "en")
    set heading(numbering: "1.")

    render_university_info(info)
    render_course_info(info)
    render_submission_details(info, current_date)
    pagebreak()

    outline(depth: 3, indent: true)
    pagebreak()

    set page(
        numbering: "1",
        number-align: center,
        margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm)
    )
    counter(page).update(1)

    body
}


// Misc items
#let note(body) = {
  block(
    fill: luma(240),
    inset: 8pt,
    radius: 4pt,
    [*Note:* #body]
  )
}

#let todo(body) = {
  text(
    fill: red,
    weight: "bold",
    [TODO: #body]
  )
}
