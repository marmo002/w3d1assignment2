class Book
  @@on_shelf = []
  @@on_loan = []

  # class METHODS
  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
    @@on_shelf << book
    book
  end

  def self.current_due_date
    # return due days for books borrowed today
    t = Time.new
    t = t + (60*60*120)
    t
  end

  def self.overdue_books
    if @@on_loan.empty?
      return false
    else
      now = Time.now
      due = @@on_loan.select do |book|
        book.due_date < now
      end
    end
  end

  def self.browse
    #return a random book from @@on_shelf
    book = @@on_shelf.sample
    book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end
  
      def initialize(title, author, isbn)
        @title = title
        @author = author
        @isbn = isbn
      end

          #Reader - Writter
          def due_date
            @due_date
          end

          def due_date=(date)
            @due_date = date
          end

              # INSTANCE METHODS
              def borrow
                #check if book is on loan
                if lend_out?
                  return false
                else
                  @due_date = Book.current_due_date
                  @@on_loan << self
                  @@on_shelf.delete(self)
                  return true
                end
              end

              def return_to_library
                if lend_out?
                  @@on_loan.delete(self)
                  @due_date = nil
                  @@on_shelf << self
                  return true
                else
                  return false
                end
              end

              def lend_out?
                # checks if book titles is found in @@on_loan
                @@on_loan.include? self
              end

              def renew
                @due_date = Book.current_due_date
              end
end

book1 = Book.create("Functions","McGill", "0001")
book2 = Book.create("Calculus","Nelson", "0002")
book3 = Book.create("Biology 12","McGill", "0003")
book4 = Book.create("Physics 12","McGill", "0004")
