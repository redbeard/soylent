String.prototype.toSymbol = ()->
  s = @toDash().replace(/\W+/gi, "-")
  s = s.substr(0, s.length - 1) if s[s.length - 1] == '-'
  s


String.prototype.toDash = () ->
  first = true
  return this.replace(/([A-Z])/g, ($1) -> 
    s = $1.toLowerCase()
    s = ("-" + s) unless (first)
    first = false
    s
  )
