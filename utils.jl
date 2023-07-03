using YAML

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

function hfun_speakers()

    data = YAML.load_file("_data/speakers.yml")
    speakers = data["speakers"]

    io = IOBuffer()

    write(io, """ <div class="container"> <div class="row justify-content-center people-widget text-center">""")

    sort!(speakers, by = speaker -> speaker["surname"])

    for speaker in speakers
        url = speaker["url"]
        name = speaker["name"]
        img = get(speaker, "img", nothing)
        affiliation = speaker["affiliation"]

        write(io, """
            <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-4">
            <a href="$url">""")
        if img === nothing
            write(io, """
                <div class="avatar-x2 avatar-circle" style="background: #ddd;">
                    <i class="fa fa-user" style="font-size: 220px; color: #eee; margin-top:20px;"></i>
                </div>
            """)
        else
            write(io, """
                <img src="/assets/speakers/$img" alt="$name" class="img-responsive img-circle avatar-x2 avatar-circle">
            """)
        end
        write(io, """
            <h3 class="text-center">$name</h3>
            <p class="text-muted text-center">$affiliation</p>
            </a>
            </div>
        """)
    end

    write(io, "</div> </div>")

    return String(take!(io))
end

function hfun_invitedtalks()

    data = YAML.load_file("_data/speakers.yml")
    speakers = data["speakers"]

    io = IOBuffer()

    write(io, "<ul>")

    sort!(speakers, by = speaker -> speaker["surname"])

    for speaker in speakers
        url = speaker["url"]
        name = speaker["name"]
        title = speaker["title"]
        affiliation = speaker["affiliation"]
        abstract = speaker["abstract"]
        bio = speaker["bio"]


        write(io, """
            <li>
            <h2> $title </h2>
            <p><strong><a href="$url">$name</a></strong> ($affiliation) <p/>
            <p><strong>Abstract: </strong>$abstract <p/>
            <div class="text-muted"><p><strong>Bio: </strong>$bio <p/></div>
            </li>
        """)

    end

    write(io, "</ul>")

    return String(take!(io))
end

function hfun_papers()

    data = YAML.load_file("_data/papers.yml")
    papers = data["papers"]

    io = IOBuffer()

    write(io, "<ul>")

    #sort!(speakers, by = speaker -> speaker["surname"])

    for paper in papers
        title = paper["title"]
        authors = paper["authors"]
        url = get(paper, "url", nothing)
        poster = get(paper, "poster", nothing)
        id = get(paper, "id", nothing)
        talk = get(paper, "talk", nothing)

        # hide gathertown id for now
        id = nothing

        gathertown = if isnothing(id)
            ""
        else
            "<small><b>GatherTown Poster ID: $id</b></small><br/>"
        end

        write(io, """
            <li><span>
            <strong><a href="$url">$title</a></strong><br/>
            <small><i>$authors </i></small><br/>
            $gathertown
            <span/></li>
        """)

    end

    write(io, "</ul>")

    return String(take!(io))
end
