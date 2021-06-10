class BooksController < ApplicationController
  def index
    # @books = Book.all
    @books = Book.includes(:author).all
  end
end

# Book -> belongs_to -> Author -> has_many Address -> belongs_to Country
# @books = Book.includes(author: {addresses: :country})

# Book -> belongs_to -> Author -> has_many Address
# @books = Book.includes(author: :addresses)
# books.each do |book|
# book.author.addresses.each do |address|
# address.street
# address.number

# @books = Book.joins(:author).select("books.title, authors.name") # this is faster ):
# SELECT books.title, authors.name
# FROM books
# JOIN authors ON authors.id = books.author_id

# Wizard (has_many :enemies, has_many :spells, belongs_to :adventuring_group)
# @wizards = Wizard.includes(:enemies, :spells, :adventuring_group)
# @wizards.each do |wizard|
# <ul> wizard.enemies.each do |enemy| <li> enemy.name </li> </ul>
# <ul> wizard.spells.each do |spell| <li> spell.name </li> </ul>
# wizard.adventuring_group.each do |adventurers|
# <ul> adventurers.each do |adventurer| <li> adventurer.name </li> </ul>

