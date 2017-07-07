# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the Monitoria CiC home page/
      '/home'

    when /^the Professores page/
      '/professores'

    when /^the Cadastrar Professor page/
      '/professores/new'

    when /^the Show Professor 2 page/
      '/professores/2'

    when /^the Editar Professor 2 page/
      '/professores/2/edit'

    # Disciplinas
    when /^Disciplinas page/
      '/disciplinas'

    when /^Disciplinas/
      '/disciplinas'

    when /^Cadastrar Disciplina page/
      '/disciplinas/new'

    when /^Cadastrar Disciplina/
      '/disciplinas/new'

    when /^Show Disciplina 1 page/
      '/disciplinas/1'

    when /^Editar Disciplina 1 page/
      '/disciplinas/1/edit'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
