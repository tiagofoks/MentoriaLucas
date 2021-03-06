require './post'
require './menu'

menu
action = gets.chomp

if action == '1'
  puts 'Digite seu post:'
  param_text = gets.chomp

  post = Post.new
  post.text = param_text
  post.create

  puts "Ultimo post cadastrado:"
  post =  Post.read_last_one
  puts post.text
end

if action == '2'
  puts 'Digite o Id referente qual mensagem deseja ler'
  puts 'Para ler todas as mensagens digite all'
  post_id_or_all = gets.chomp

  if post_id_or_all  == 'all'
    Post.read_all.each do |post|
      puts post.text
    end
  else
    post = Post.read_individual(post_id_or_all)
    puts post.text
  end
end

if action == '3'
  puts 'Informe o id da mensagem que deseja atualizar'
  post_id = gets.chomp

  post = Post.read_individual(post_id)

  puts 'Digite a nova mensagem para o Post:'
  message_update = gets.chomp

  post.text = message_update
  post.update

  puts 'Confira sua mensagem atualizada!'
  up_post = Post.read_individual(post_id)
  puts up_post.text
end

if action == '4'
  puts 'Digite o Id da mensagem que deseja deletar'
  id_message = gets.chomp

  post = Post.read_individual(id_message)
  post.delete
  puts 'Esta mensagem foi deletada!'
end
