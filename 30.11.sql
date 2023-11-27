CREATE FUNCTION get_books_for_student(student_name VARCHAR(255), available_books INT)
RETURNS INT AS $$
BEGIN
    IF student_name = 'Александр' THEN
        IF available_books >= 2 THEN
            RETURN 2;
        ELSEIF available_books = 1 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    ELSE
        IF available_books >= 1 THEN
            RETURN 1;
        ELSE
            RETURN 0;
        END IF;
    END IF;
END; $$
LANGUAGE gsql;
 ----------------------------------

 CREATE FUNCTION get_books_for_teacher(requested_book_id INT, available_books INT)
RETURNS INT AS $$
BEGIN
    IF requested_book_id IS NULL THEN
        IF available_books > 0 THEN
            RETURN 1;
        ELSE
            RAISE NOTICE 'В библиотеке нет книг';
            RETURN 0;
        END IF;
    ELSE
        RETURN requested_book_id;
    END IF;
END; $$
LANGUAGE gsql;
