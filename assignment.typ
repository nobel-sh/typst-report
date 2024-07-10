#let spaced_block(content,space: 2em) = {
    block(content)
    v(space)
}

#let image_block(path, width, margin: 2em) = {
    v(margin)
    block(image(path, width: width))
    v(margin)
}

#let render_university_info(info) = {
    let university = info.university

    block(university.name)
    block(university.department)
    block(university.location)
    image_block(university.logo, 6cm, margin:1.5em)
}

#let render_course_info(info)= {
    let course = info.course
    let activity = info.activity

    block(course.code)
    block(course.title)
    if "description" in activity {
        block(activity.title)
        spaced_block(["#activity.description"])
    } else {
        spaced_block(activity.title)
    }
}

#let render_submission_info(info, current_date) = {
    let student = info.student
    let tutor = info.tutor

    block("Submitted by")
    spaced_block([#student.name (#student.roll_no)])

    block("Submitted to")
    block(tutor.name)
    if "post" in tutor {
        block(tutor.post)
    }
    spaced_block(tutor.department, space: 1.5em)

    block("Submission Date")
    spaced_block(current_date)
}

#let assignment(body) = {
    let info = toml("config.toml")
    let current_date = if "date" in info {
        info.date
    } else {
        datetime.today().display("[month repr:long] [day], [year]")
    }

    set document(
        author: info.student.name,
        title: info.activity.title,
    )
    set heading(numbering: "1.")

    // Front page
    set align(center)
    set text(weight: "bold", size: 14pt)

    render_university_info(info)
    render_course_info(info)
    render_submission_info(info, current_date)
    pagebreak()

    // Table of Content
    set text(weight: "regular")
    show outline.entry.where(level: 1): body => {
       v(8pt)
       strong(body)
    }
    set outline(
      title:{
        text("Table of Contents")
        v(1em)
    })

    set text(size: 12pt)
    outline(depth:3, indent: 2em, fill: repeat([-]))
    pagebreak()
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
