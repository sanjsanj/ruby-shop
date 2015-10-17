module ServerHelpers
  def partial(template:, locals: {})
    erb(template, locals: locals)
  end
end
