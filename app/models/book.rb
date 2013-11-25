class Book < ActiveRecord::Base
  before_create :count_books

  protected

  def count_books
    self.book_count = Book.count
    logger.info "Number of Books: #{Book.count}"
    logger.info "Books where isbn equals x, sql is: #{Book.where(:isbn => 'x').to_sql}"
  end
end
