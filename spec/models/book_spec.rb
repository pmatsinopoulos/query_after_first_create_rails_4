require 'spec_helper'

describe Book do
  describe 'find or create' do
    it 'should use the correct query' do
      book = nil
      expect do
        book = Book.create!(:isbn => '1', :name => 'name1', :author => 'author1')
      end.to change { Book.count }.by(1)
      expect(book.book_count).to eq(0)

      expect do
        book = Book.create!(:isbn => '2', :name => 'name2', :author => 'author2')
      end.to change { Book.count }.by(1)
      expect(book.book_count).to eq(1)

      expect do
        book = Book.create!(:isbn => '3', :name => 'name3', :author => 'author3')
      end.to change { Book.count }.by(1)
      expect(book.book_count).to eq(2)

      expect do
        book = Book.where(:isbn => '4').first_or_create!(
            :name => 'name4',
            :author => 'author3'
       )
      end.to change { Book.count }.by(1)
      expect(book.book_count).to eq(3)
    end
  end
end