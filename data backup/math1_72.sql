--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    num integer,
    page integer,
    qtext text,
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    answer text,
    qimage character varying(255),
    aimage character varying(255),
    "shortAnswer" character varying(255),
    presenter1 character varying(255),
    presenter2 character varying(255),
    level integer
);


ALTER TABLE public.questions OWNER TO action;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO action;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: questions_topics; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE questions_topics (
    question_id integer NOT NULL,
    topic_id integer NOT NULL
);


ALTER TABLE public.questions_topics OWNER TO action;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO action;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    "topicName" character varying(255),
    comments text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.topics OWNER TO action;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO action;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: action; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean DEFAULT false,
    teacher boolean DEFAULT false,
    viewer boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO action;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: action
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO action;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: action
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: action
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions (id, num, page, qtext, notes, created_at, updated_at, answer, qimage, aimage, "shortAnswer", presenter1, presenter2, level) FROM stdin;
14	10	1	Wes bought some school supplies at an outlet store in Maine, a state that has a 6.5% sales tax. Including the sales tax, how much did Wes pay for two blazers priced at $49.95 each and 3 pairs of pants priced at $17.50 each?		2014-07-07 06:29:17.415032	2014-07-07 06:29:17.415032	((2 * 49.95) + ( 3 * 17.50)) * 1.065 = 162.31	\N	\N	\N	\N	\N	\N
15	11	1	(Continuation) A familiar feature of arithmetic is that multiplication distributes over addition. Written in algebraic code, this property looks like a(b+c) = ab+ac. Because of this property, there are two equivalent methods that can be used to compute the answer in the previous problem. Explain, using words and complete sentences.		2014-07-07 06:31:19.432972	2014-07-07 06:31:19.432972	You can either find the price of each individual item and figure the tax, or you can find the pre-tax total and then figure the tax. It ends up the same due to the distributive property.	\N	\N	\N	\N	\N	\N
16	2	2	Pick any number. Add 4 to it and then double your answer. Now subtract 6 from that result and divide your new answer by 2. Write down your answer. Repeat these steps with another number. Continue with a few more numbers, comparing your final answer with your original number. Is there a pattern to your answers?		2014-07-07 14:57:52.426665	2014-07-07 14:57:52.426665	1 -> 2\r\n2 -> 3\r\n100 -> 101\r\n\r\n(2(x+4)-6)/2\r\n(2x+2)/2\r\nx+1	\N	\N	\N	\N	\N	\N
17	3	2	Using the four integers 2, 3, 6 and 8 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, write expressions whose values are the target numbers given below. You will probably need to use parentheses. For example, to hit the target 90, you could write 90 = (3 + 6) · (8 + 2). \r\n\r\n(a) 3 (b) 24 (c) 36 (d) 30	Trial and error/Pattern building\r\nSee what other numbers can be made from pairs, triplets	2014-07-07 15:12:05.863401	2014-07-07 15:12:05.863401	(a)  2+3+6-8 = 3\r\n(b) (3*6)-2+8 = 24\r\n(c) (2*6*9)/3 = 36\r\n(d) ((2*8)-6)*3 = 30	\N	\N	\N	\N	\N	\N
18	4	2	When describing the growth of a population, the passage of time is sometimes described in generations, a generation being about 30 years. One generation ago, you had two ancestors (your parents). Two generations ago, you had four ancestors (your grandparents). Ninety years ago, you had eight ancestors (your great-grandparents). How many ancestors did you have 300 years ago? 900 years ago? Do your answers make sense?	Powers of two	2014-07-08 03:41:23.04528	2014-07-08 03:41:23.04528	g1 - 2    -  30 years\r\ng2 - 4    -  60 years\r\ng3 - 8    -  90 years\r\ng4 - 16   - 120 years\r\ng5 - 32   - 150 years\r\ng6 - 64   - 180 years\r\ng7 - 128  - 210 years\r\ng8 - 256  - 240 years\r\ng9 - 512  - 270 years\r\ng10- 1,024- 300 years = 2^10\r\ng30-        900 years = 2^30 = 1,073,741,824\r\n\r\nIt doesn't make sense as there probably weren't even 1 billion humans alive 900 years ago; the number is probably much lower due to common ancestors.\r\n	\N	\N	\N	\N	\N	\N
3	1	2	Woolworth’s had a going-out-of-business sale. The price of a telephone before the sale was $39.98. What was the price of the telephone after a 30% discount? If the sale price of the same telephone had been $23.99, what would the (percentage) discount have been?	Percentage review	2014-02-14 17:14:06.59592	2014-07-05 06:08:14.346362	39.99 * .7,\r\n\r\n(39.99-23.99)/39.99	\N	\N	\N	\N	\N	\N
1	1	1	Light travels at about 186 thousand miles per second, and the Sun is about 93 million miles from the Earth. How much time does light take to reach the Earth from the Sun?		2014-02-14 17:13:05.764503	2014-07-05 06:14:52.00225	93,000,000/186,000 = # of seconds it takes = 500\r\n500/60 = 8 minutes 20 seconds	\N	\N	\N	\N	\N	\N
2	2	1	How long would it take you to count to one billion, reciting the numbers one after another? First write a guess into your notebook, then come up with a thoughtful answer. One approach is to actually do it and have someone time you, but there are more manageable alternatives. What assumptions did you make in your calculations?	Easy to make mistakes when dealing with very large numbers.	2014-02-14 17:13:41.019212	2014-07-05 06:21:24.866224	It's going to take a long time, since almost all of the numbers are greater than 1 million and it takes several seconds just to say one very large number. If the average number takes about 5 seconds, it would take around 5 billion seconds. 5,000,000,000/(60*60*24*365) gives an estimate of about 158 years.	\N	\N	\N	\N	\N	\N
7	3	1	It takes 1.25 seconds for light to travel from the Moon to the Earth. How many miles away is the Moon?	The orbit is elliptical, not round, so this is at best an approximation, or more strictly speaking the distance from the earth to the moon isn't a constant value.	2014-07-07 05:52:27.924879	2014-07-07 05:52:27.924879	186000*1.25=232,500 miles	\N	\N	\N	\N	\N	\N
8	4	1	Many major-league baseball pitchers can throw the ball at 90 miles per hour. At that \r\nspeed, how long does it take a pitch to travel from the pitcher’s mound to home plate, a distance of 60 feet 6 inches? Give your answer to the nearest hundredth of a second. There are 5280 feet in a mile.	What's the difference in time for a 79mph curveball?	2014-07-07 06:01:42.069819	2014-07-07 06:02:08.124077	90mph*5280 = 475,200fph/60  = 7920fpm/60 = 132 fps\r\n132/60.5 = 2.18 seconds\r\n	\N	\N	\N	\N	\N	\N
9	5	1	You have perhaps heard the saying, “A journey of 1000 miles begins with a single step.” How many steps would you take to finish a journey of 1000 miles? What information do you need in order to answer this question? Find a reasonable answer. What would your answer be if the journey were 1000 kilometers?	Again, values are under the control of the stepper.	2014-07-07 06:06:28.481688	2014-07-07 06:06:28.481688	How long is a step? Estimate 2.5 feet per step.\r\n5280/2.5 = 2,112 steps per mile, or 2,112,000 for a thousand miles.\r\nI km = ~.625 miles, so ~1,320,000 steps for 1,000 km. 	\N	\N	\N	\N	\N	\N
10	6	1	In an offshore pipeline, a cylindrical mechanism called a “pig” is run through the pipes periodically to clean them. These pigs travel at 2 feet per second. What is this speed, expressed in miles per hour?		2014-07-07 06:15:33.530602	2014-07-07 06:15:33.530602	2 fps = 2 * 60 * 60 or 7200 fph.\r\n7200/5280 = 1.3636 mph.	\N	\N	\N	\N	\N	\N
11	7	1	Your class sponsors a benefit concert and prices the tickets at $8 each. Dale sells 12 tickets, Andy 16, Morgan 17, and Pat 13. Compute the total revenue brought in by these four persons. Notice that there are two ways to do the calculation.		2014-07-07 06:19:03.256325	2014-07-07 06:19:03.256325	(12+15+17+13) * 8 or\r\n12*8 + 16*8 + 17*8 + 13*8\r\n$464	\N	\N	\N	\N	\N	\N
12	8	1	Kelly telephoned Brook about a homework problem. Kelly said, “Four plus three times two is 14, isn’t it?” Brook replied, “No, it’s 10.” Did someone make a mistake? Can you explain where these two answers came from?		2014-07-07 06:21:54.709149	2014-07-07 06:21:54.709149	Depends on order of operations, without parentheses it isn't clear if it is (4+3)*2 or 4+(3*2), though the latter could be argued to be correct under strict PEMDAS interpretation.	\N	\N	\N	\N	\N	\N
19	5	2	On a recent episode of Who Wants to Be a Billionaire, a contestant was asked to\r\narrange the following five numbers in increasing order. You try it, too.\r\n(a) 2/3 (b) 0.6666 (c) 3/5 (d) 0.666 (e) 0.67		2014-07-08 03:45:23.715799	2014-07-08 03:45:23.715799	a = 0.66667  (approximation)\r\nb = 0.66660\r\nc = 0.60000\r\nd = 0.66600\r\ne = 0.67000\r\n\r\nc, d, b, a, e	\N	\N	\N	\N	\N	\N
13	9	1	It is customary in algebra to omit multiplication symbols whenever possible. For example, 11x means the same thing as 11 · x. Which of the following can be condensed by leaving out a multiplication symbol? (a) 4 · 1/3  (b) 1.08 · p (c) 24 · 52 (d) 5 · (2 + x)\r\n	a would look like 4.33\r\nc would look like 2452	2014-07-07 06:26:23.749204	2014-07-07 15:44:01.833295	b - 1.08p\r\nd - 5(2+x)\r\n	\N	\N	\N	\N	\N	\N
20	6	2	The area of a circle whose radius is r is given by the expression r2. Find the area of each of the following circles to the nearest tenth of a square unit of measure:\r\n(a) a circle whose radius is 15 cm (b) a circle whose radius is 0.3 miles	How many decimals of pi to use?	2014-07-08 03:49:45.821713	2014-07-08 03:49:45.821713	a. 707.5 cm^2 or 706.8 with more accurate pi\r\nb. 0.3 mi^2	\N	\N	\N	\N	\N	\N
21	7	2	Choose any number. Double it. Subtract six and add the original number. Now divide by three. Repeat this process with other numbers, until a pattern develops. By using a variable such as x in place of your number, show that the pattern does not depend on which number you choose initially.		2014-07-08 03:54:11.084972	2014-07-08 03:54:11.084972	5*2 = 10\r\n10 - 6 = 4\r\n4 + 5 = 9\r\n9/3 = 3\r\n\r\n(2x - 6 + x )/3 -> (3x - 6)/3 -> x - 2	\N	\N	\N	\N	\N	\N
22	8	2	Explain why there are two ways to compute each of the following:\r\n(a) 3(2 + 3 + 5) \r\n(b) 1/3*(9 + 6 − 3) \r\n(c) (9 + 6 − 3) ÷ 3\r\n		2014-07-08 03:56:59.589915	2014-07-08 03:56:59.589915	Either distribute across the terms, or find the value within the parentheses and then apply the outside term.	\N	\N	\N	\N	\N	\N
23	9	2	Given the information w = 4 inches and h = 7 inches, find two ways to evaluate 2w + 2h. What is the geometric significance of this calculation?		2014-07-08 03:59:35.277779	2014-07-08 03:59:35.277779	(2*4)+(2*7) or 2(4+7)\r\nPerimeter, assuming w is width and h height of a rectangle.	\N	\N	\N	\N	\N	\N
24	10	2	Simplify x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2 + x + 2.		2014-07-08 04:00:25.307589	2014-07-08 04:00:25.307589	9x + 18	\N	\N	\N	\N	\N	\N
25	11	2	Without resorting to decimals, find equivalences among the following nine expressions:\r\n(2·3)/5    (3/5)·2    3·(2/5)   (2/5)(3/3)   (5/3)2   2÷(5/3)  2/5  (5/3)÷(1/2)  3/(5/2)		2014-07-08 04:10:00.062833	2014-07-08 04:10:00.062833	18/15   18/15   18/15   6/15    50/15    18/15    6/15    50/15    18/15	\N	\N	\N	\N	\N	\N
26	1	3	What is the value of 3 + (−3)? What is the value of (−10.4) + 10.4? These pairs of numbers are called opposites. What is the sum of a number and its opposite? Does every number have an opposite? State the opposite of:\r\n(a) −2.341 (b) 1/3 (c) x (d) x + 2 (e) x − 2		2014-07-08 15:41:41.391709	2014-07-08 15:41:41.391709	Sums are 0\r\n0 has no opposite, except perhaps 0\r\n2.34   -1/3     -x     -(x+2)   -(x-2)	\N	\N	\N	\N	\N	\N
27	2	3	As shown on the number line below, k represents an unknown number between 2 and\r\n3. Plot each of the following, extending the line if necessary:\r\n(a) k + 3 (b) k − 2 (c) −k (d) 6 − k\r\n\r\n----|----|----|----|----|----|--.-|----|----|----|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6		2014-07-08 15:46:57.729952	2014-07-08 15:49:49.520129	----|-.--|----|----|--.-|----|--.-|-.--|----|--.-|----\r\n   -3   -2   -1    0    1`   2  k 3    4    5    6	\N	\N	\N	\N	\N	\N
43	4	5	What is the value of 2/3· 3/2? \r\nWhat is the value of 4 · 1/4? \r\nThese pairs of numbers are called reciprocals. What is the product of a number and its reciprocal? Does every number have a reciprocal? State the reciprocal of the following:\r\n(a) 5/3\r\n(b) −1/2\r\n(c) 2000 \r\n(d) a/b\r\n(e) 1.2 \r\n(f) x		2014-07-10 02:02:48.403589	2014-07-10 02:03:53.359232	1,1 \r\n0 doesn't have a reciprocal as division by zero is undefined\r\na) 3/5\r\nb) -2\r\nc) 1/2000\r\nd) b/a\r\ne) 1/1.2\r\nf) 1/x	\N	\N	\N	\N	\N	\N
44	5	5	Here is another number puzzle: Pick a number, add 5 and multiply the result by 4. Add another 5 and multiply the result by 4 again. Subtract 100 from your result and divide your answer by 8. How does your answer compare to the original number? You may need to do a couple of examples like this until you see the pattern. Use a variable for the chosen number and show how the pattern holds for any number.		2014-07-10 02:06:39.062544	2014-07-10 02:06:39.062544	5,10,40,45,180,80,10\r\nTwice the original number\r\nx, x+5, 4x + 20, 4x + 25, 16x + 100, 16x, 2x	\N	\N	\N	\N	\N	\N
45	6	5	(Continuation) Make up a number puzzle of your own. Be able to verify the pattern using a variable for the number chosen initially.		2014-07-10 02:10:30.265872	2014-07-10 02:10:30.265872	Pick a number. Double it. Add 10. Double it again. Subtract 20. Divide by 2.\r\n\r\nx, 2x, 2x + 10, 4x + 20, 4x, 2x\r\n\r\n2, 4, 14, 28, 8, 4	\N	\N	\N	\N	\N	\N
46	7	5	Jess takes a board that is 50 inches long and cuts it into two pieces, one of which is 16 inches longer than the other. How long is each piece?		2014-07-10 02:11:09.144842	2014-07-10 02:42:59.402709	33 and 17 inches.\r\nOne is 8 more than 25 and the other 8 less.	\N	\N	\N	\N	\N	\N
47	8	5	Consider the sequence of numbers 2; 5; 8; 11; 14; : : : , in which each number is three more than its predecessor.\r\n(a) Find the next three numbers in the sequence.\r\n(b) Find the 100th number in the sequence.\r\n(c) Using the variable n to represent the position of a number in the sequence, write an expression that allows you to calculate the nth number. The 200th number in the sequence is 599. Verify that your expression works by evaluating it with n equal to 200.		2014-07-10 02:45:29.344025	2014-07-10 02:45:29.344025	a) 17,20,23\r\nb) 299\r\nc) (n*3) - 1\r\n   200*3 = 600 -1 = 599	\N	\N	\N	\N	\N	\N
48	9	5	A group of ten persons were planning to contribute equal amounts of money to buy some pizza. After the pizza was ordered, one person left. Each of the other nine persons had to pay 60 cents extra as a result. How much was the total bill?		2014-07-10 02:45:55.479244	2014-07-10 03:18:26.849142	10th share equals 9 * .60 or $5.40\r\nSo $54.00 for 10 shares.	\N	\N	\N	\N	\N	\N
49	1	6	In the balance diagram below, find the number of marbles that balance one cube.\r\n\r\ncccmmmmmmm    ccccc  mmm\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-10 03:19:20.255455	2014-07-10 03:22:17.914294	 3c + 7m = 5c + 3m\r\n-3c + 3m   3c + 3m\r\n      4m = 2c\r\n      2m = 1c	\N	\N	\N	\N	\N	\N
51	3	6	On each of the following number lines, all of the labeled points are evenly spaced. Find coordinates for the seven points designated by the letters.\r\n\r\n---|----|----|----|----|----|----\r\n   3    a    b    c    d`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r		2014-07-10 03:24:25.028365	2014-07-10 03:31:13.875265	---|----|----|----|----|----|----\r\n   3    7   11   15   19`  23    \r\n\r\n---|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----\r\n                  p   8/3   q    6    r\r\n                  1       13/3 18/3 23/3	\N	\N	\N	\N	\N	\N
50	2	6	For each of the following, find the value of x that makes the equation true. The usual way of wording this instruction is solve for x :\r\n\r\n(a) 2x = 12 (b) −3x = 12 (c) ax = b		2014-07-10 03:23:40.007996	2014-08-18 17:01:25.976694	a) x = 6\r\nb) x = -4\r\nc) x = b/a	\N	\N	\N	\N	\N	\N
40	1	5	Use the balance diagram below to find how many marbles it takes to balance one cube.\r\n\r\ncccmmmmmmm    ccccc  m\r\n----------   -----------\r\n     |-----------|\r\n           ^		2014-07-09 04:37:30.095672	2014-07-24 16:28:59.687685	3 cubes and 7 marbles balance 5 cubes and 1 marble\r\nIt would still balance if you took away 3 cubes from each side.\r\nThen there would be 7 marbles on the left and 2 cubes and 1 marble on the right\r\nTake away 1 marble from each side, still balances\r\n6 marbles on the left, 2 cubes on the right\r\nThus 3 marbles weighs the same as 1 cube.	PBL_Graph_5_1.PNG	\N	\N	\N	\N	\N
28	3	3	You are already familiar with operations involving positive numbers, but much mathematical work deals with negative numbers. Common uses include temperatures, money, and games. It is important to understand how these numbers behave in arithmetic calculations. First, consider addition and subtraction. For each of the following, show how the answer can be visualized using a number-line diagram:\r\n(a) The air temperature at 2 pm was 12◦. What was the air temperature at 8 pm, if it had dropped 15◦ by then?\r\n(b) Telescope Peak in the Panamint Mountain Range, which borders Death Valley, is 11045 feet above sea level. At its lowest point, Death Valley is 282 feet below sea level. What is the vertical distance from the bottom of Death Valley to the top of Telescope Peak?\r\n(c) In a recent game, I had a score of 3. I then proceeded to lose 5 points and 7 points on my next two turns. On the turn after that, however, I gained 8 points. What was my score at this moment in the game?		2014-07-08 15:52:34.262475	2014-07-08 16:29:50.008523	a) -----|-----|--.--|-----|-----|-----|-----|-----|-----|-----.-----\r\n       -6    -4    -2     0     2`    3     6     8    10    12\r\n                8 p.m.                                      2 p.m.\r\n\r\nb) ----|----|----|---,|----|----|----|----|----|--,-|----\r\n      -3k  -2k  -1k   0   2k   4k   6k   8k   10k  12k\r\n\r\nc) ----|----3----|----|----|----|----|----|----2----4----|----|----|----1----|----|----|----  Final score: -1\r\n      -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6	\N	\N	\N	\N	\N	\N
29	4	3	To buy a ticket for a weekly state lottery, a person selects 6 integers from 1 to 36, the order not being important. There are 1947792 such combinations of six digits. Alex and nine friends want to win the lottery by buying every possible ticket (all 1947792 combinations), and plan to spend 16 hours a day doing it. Assume that each person buys one ticket every five seconds. What do you think of this plan? Can the project be completed within a week?		2014-07-08 16:34:13.133959	2014-07-08 16:34:13.133959	10 tickets every 5 seconds.\r\n120 tickets per minute. (times 12)\r\n7200 tickets per hour.  (times 60)\r\n115200 tickets per day. (times 16 hour day)\r\n806400 tickets per week.(times 7 days in a week)\r\n\r\nStupid plan.\r\n\r\n	\N	\N	\N	\N	\N	\N
30	5	3	Locate the following numbers relative to each other on a number line:\r\n(a) 3.03 (b) 3.303 (c) 3.033 (d) 3.333 (e) 3.33		2014-07-08 16:44:33.708883	2014-07-08 16:57:24.013229	----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.00      3.01      3.02      3.03      3.04      3.05      3.06      3.07      3.08      3.09      3.10\r\n                               3.03  3.033                       \r\n----|--.------|---------|---------.--.------|---------|---------|---------|---------|---------|---------|----\r\n   3.30      3.31      3.32      3.33      3.34      3.35      3.36      3.37      3.38      3.39      3.4\r\n     3.303                     3.33 3.333	\N	\N	\N	\N	\N	\N
31	6	3	The area of the surface of a sphere is described by the formula S = 4r^2, where r is the radius of the sphere. The Earth has a radius of 3960 miles and dry land forms approximately 29.2% of the Earth’s surface. What is the area of the dry land on Earth?\r\nWhat is the surface area of the Earth’s water?		2014-07-08 17:05:04.231663	2014-07-08 17:05:04.231663	4*3.14*3960^2 =196,960,896 sq. for the earth\r\n\r\n 57,512,582 sq. ni. of land\r\n\r\n139,448,314 s1. mi. of water	\N	\N	\N	\N	\N	\N
32	7	3	Mark a random number x between 1 and 2 (at a spot that only you will think of) on a number line. Plot the opposite of each of the following:\r\n(a) x (b) x + 5 (c) x − 4 (d) 6 − x\r\n		2014-07-08 17:06:35.294021	2014-07-08 17:10:15.506411	---|----|----|----|----|----|----|----|-c--|--a-|----|----|-x--|----|----|--d-|-b--|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0    1`   2    3    4    5    6	\N	\N	\N	\N	\N	\N
33	1	4	At 186282 miles per second, how far does light travel in a year? Give your answer in miles, but use scientific notation, which expresses a number like 93400000 as 9:34 × 10^7 (which might appear on your calculator as 9.34 E7 instead). A year is approximately 365.25 days. The answer to this question is called a light year by astronomers, who use it to measure huge distances. Other than the Sun, the star nearest the Earth is Proxima Centauri, a mere 4.2 light years away.	Approximation due to length of year being inexact	2014-07-08 22:17:25.898376	2014-07-08 22:17:36.68604	186282 * 60 * 50 *24 *365.25 = 5,878,612,843,200\r\n\r\n5.878612843200E12	\N	\N	\N	\N	\N	\N
35	3	4	Later you have another chocolate bar. This time, after you give away 1/3 of the bar,a friend breaks off 3/4 of the remaining piece. What part of the original chocolate bar do you have left? Answer this question by drawing a diagram.		2014-07-08 22:23:34.841057	2014-07-08 22:23:34.841057	Have   Give\r\nxx        x       2/3\r\nxxxx     xx       4/6\r\nx     xxxxx       1/6	\N	\N	\N	\N	\N	\N
34	2	4	Before you are able to take a bite of your new chocolate bar, a friend comes along and takes 1/4 of the bar. Then another friend comes along and you give this person 1/3 of what you have left. Make a diagram that shows the part of the bar left for you to eat.		2014-07-08 22:19:12.938515	2014-07-08 22:23:57.203635	xxx    x\r\nxx     x\r\nHalf	\N	\N	\N	\N	\N	\N
37	5	4	The temperature outside is dropping at 3 degrees per hour. Given that the temperature at noon was 0◦, what was the temperature at 1 pm? at 2 pm? at 3 pm? at 6 pm? What was the temperature t hours after noon?		2014-07-09 04:24:20.582525	2014-07-09 04:24:20.582525	-3\r\n-6\r\n-9\r\n-18\r\n-3t	\N	\N	\N	\N	\N	\N
38	6	4	This year, there are 1016 students at the Academy, of whom 63 live in Dunbar Hall.\r\nTo the nearest tenth of a percent, what part of the student population lives in Dunbar?	Rounding	2014-07-09 04:26:03.794781	2014-07-09 04:26:03.794781	0.06200%\r\nto the nearest tenth, then, 0.1%	\N	\N	\N	\N	\N	\N
39	7	4	Let k represent some unknown number between −4 and −5. Locate between two consecutive integers each of the following:\r\n(a) −k (b) −k + 5 (c) k/2+ 2 (d) (k + 2)/2\r\n		2014-07-09 04:31:51.383867	2014-07-09 04:31:51.383867	a) 4 and 5\r\nb) 9 and 14\r\nc) 0 and -1\r\nd) -1 and -2	\N	\N	\N	\N	\N	\N
41	2	5	(Continuation) Using c to stand for the weight of one cube and m for the weight of one marble, write an equation that models the picture in the previous problem. Use this equation to find how many marbles it takes to balance one cube.		2014-07-09 04:40:48.754147	2014-07-09 04:40:48.754147	 3c + 7m  =   5c + m\r\n-(3c + m) = -(3c + m)\r\n    6m/2  =   2c/2\r\n      3m  =    c	\N	\N	\N	\N	\N	\N
42	3	5	The division problem 12÷(3/4) is equivalent to the multiplication problem 12·(4/3) . Explain. Write each of the following division problems as equivalent multiplication problems:\r\n(a) 20 ÷ 5 \r\n(b) 20 ÷ 1/5\r\n(c) 20 ÷ 2/5\r\n(d) a ÷ b/c\r\n(e) b/c ÷ a		2014-07-10 01:01:21.912461	2014-07-10 01:59:17.494071	To eliminate the fractional denominator one must change it to 1. This can be done for any fraction by multiplying by the reciprocal. To not change the overall value the  multiplying the numerator also must be multiplied by the same value.\r\na) 20 * 1/5\r\nb) 20 * 5\r\nc) 20 * 5/2\r\nd) a * c/b\r\ne) b/c * 1/a or b/(a*c)	\N	\N	\N	\N	\N	\N
495	2	51	You have one x2-block, eight x-blocks, and an ample supply of 1-blocks. How many 1-blocks do you need to form a square? What are the dimensions of the square? Fill in the blanks in the identity x^2 + 8x + = ( )( ) = ( )2.		2014-08-10 04:26:04.914749	2015-01-09 14:52:01.536938	16 one blocks are needed. The square is x+4 by x+4\r\nx^2 + 8x + 16 = (x + 4)(x + 4) = (x + 4)²	\N	\N	16, (x + 4)²	Jaden	Christian	1
52	5	6	A rectangle whose length is x and whose width is 1 is called an x-block. The figure shows two of them. ------      -----\r\n(a) What is the area of an x-block?                                                                    |    | 1    |   |\r\n(b) What is the combined area of two x-blocks?                                                         ------     X|   |\r\n(c) Show that there are two different ways to combine two x-blocks                                        X        |   |\r\nto form a rectangle whose area is 2x.                                                                              -----\r\n(d) Draw two different rectangular diagrams to show that x + 2x = 3x.                                                1		2014-07-10 03:37:24.575664	2014-07-10 03:39:32.123779	a) x\r\nb) 2x\r\nc)||  or --\r\nd) ||| or ---\r\n	\N	\N	\N	\N	\N	\N
60	2	7	Make a dot somewhere between 0 and 0.5 on a number line, and label it k. Place each of the following on the same number line as accurately as you can.\r\n(a) −k (b) 2k (c) k^2 (d) k − 2 (e)√k		2014-07-10 05:17:32.335743	2014-07-10 05:21:54.466137	---|----|----|----|----|----|----|----|----|c---|---a|.b--|----|----|----|----|----|----\r\n  -10  -9   -8   -7   -8   -5   -4   -3   -2   -1    0 e  1`   2    3    4    5    6\r\n                                                     ck	\N	\N	\N	\N	\N	\N
61	3	7	Simplify each of the following:\r\n(a) the sum of 6x + 2 and −8x + 5;\r\n(b) the result of subtracting 5x − 17 from 8x + 12;\r\n(c) the product of 7x and 4x − 9.		2014-07-10 05:23:36.826162	2014-07-10 05:23:36.826162	a) -2x + 7\r\nb) 3x - 5\r\nc) 28x^2 - 63x	\N	\N	\N	\N	\N	\N
53	4	6	Using the four integers 1, 2, 3 and 4 once each — in any order — and three arithmetic operations selected from among addition, subtraction, multiplication, and division, is it possible to write an expression whose value is 1? Using the same numbers and conditions, how many of the integers from 1 to 10 can you form? You will need to use parentheses		2014-07-10 03:38:54.303938	2014-07-10 04:28:55.323714	(2*3)-(1+4) = 1\r\n((2*3)/1)-4 = 2\r\n(2*3)+1-4   = 3\r\n(4*2)-(3+1) = 4\r\n(2*4)-(3/1) = 5\r\n(2*4)+1 -3  = 6\r\n((3*4)/2)+1 = 7\r\n(4/2)*(3+1) = 8\r\n(4*3)-(2+1) = 9\r\n(4*3)-(2/1) = 10	\N	\N	\N	\N	\N	\N
54	6	6	Use the distributive property to explain why 3x + 2x can be simplified to 5x.		2014-07-10 04:00:45.240794	2014-07-10 04:30:05.69924	3x + 2x = x(3+2) = 5x	\N	\N	\N	\N	\N	\N
55	7	6	(Continuation) Write each of the following as a product of x and another quantity:\r\n(a) 16x + 7x (b) 12x − 6x (c) ax + bx (d) px − qx\r\n		2014-07-10 04:31:32.769783	2014-07-10 04:31:32.769783	a) 23x\r\nb) 6x\r\nc) x(a+b)\r\nd) x(p-q)	\N	\N	\N	\N	\N	\N
56	8	6	Solve each of the following equations for x:\r\n(a) 16x + 7x = 46 (b) 12x − 6x = 3 (c) ax + bx = 10 (d) px − qx = r		2014-07-10 04:32:05.451275	2014-07-10 04:34:43.426952	a) x = 2\r\nb) x = 1/2\r\nc) x(a+b) = 10, x = 10/(a+b)\r\nd) x(p-q) = r, x = r/(p-q)	\N	\N	\N	\N	\N	\N
57	9	6	Draw a balance diagram that is modeled by the equation c+m+c+7m+c = 2c+2m+3c.\r\nHow many marbles will one cube balance?		2014-07-10 04:35:16.016325	2014-07-10 05:05:01.046902	cmcmmmmmmmc    cc mm ccc\r\n-----------   -----------\r\n     |-----------|\r\n\r\n           ^\r\n 3c + 8m = 5c + 2m\r\n 3c + 2m   3c + 2m\r\n      6m = 2c\r\n      3m = c	\N	\N	\N	\N	\N	\N
58	10	6	You have seen that multiplication distributes over addition. Does multiplication distribute over subtraction? Does multiplication distribute over multiplication? Does multiplication distribute over division? Use examples to illustrate your answers.		2014-07-10 04:35:43.783022	2014-07-10 05:11:38.468246	2(4-3) = 8-6, a(b-c)  = ab-ac, yes\r\n2(4*3)!= 8*6, a(b*c) != ab*ac, no\r\n2(4/3)!= 8/6, a(b/c) != ab/c, no	\N	\N	\N	\N	\N	\N
59	1	7	In baseball statistics, a player’s slugging ratio is defined to be (s + 2d + 3t + 4h)/b, where s is the number of singles, d the number of doubles, t the number of triples and h the number of home runs obtained in b times at bat. Dana came to bat 75 times during the season, and hit 12 singles, 4 doubles, 2 triples, and 8 home runs. What is Dana’s slugging ratio, rounded to three decimal places?		2014-07-10 05:16:32.379842	2014-07-10 05:16:32.379842	((12+(2*4)+(3*2)+(4*8))/75\r\n(12+8+6+32)/75\r\n58/75\r\n.773	\N	\N	\N	\N	\N	\N
62	4	7	Solve 2/3 (3x + 14) = 7x+6, by first multiplying both sides of the equation by 3, before applying the distributive property.		2014-07-10 05:30:18.71841	2014-07-10 05:30:18.71841	2(3x + 14) = 21x + 18\r\n 6x + 28 = 21x + 18\r\n-6x - 18  -6x  - 18\r\n 10 = 15x\r\n  x = 10/15\r\n  x = 2/3\r\n\r\nCheck:\r\n2/3 ( 3*2/3 + 14) = 7*(2/3) + 6\r\n2/3(16) = 14/3 + 18/3\r\n32/3 = 32/3	\N	\N	\N	\N	\N	\N
63	5	7	Because 12x^2 + 5x^2 is equivalent to 17x^2, the expressions 12x^2 and 5x^2 are called like\r\nterms. Explain. Why are 12x^2 and 5x called unlike terms? Are 3ab and 11ab like terms?\r\nExplain. Are 12x^2 and 5y^2 like terms? Explain. Are 12x^2 and 12x like terms? Explain		2014-07-10 18:29:38.251724	2014-07-10 18:29:38.251724	Like terms have the save variable raised to the same power, in effect they represent the same value.\r\n12x^2 and 5x are unlike because the variable in the first term is x*x, while in the second it is only x.\r\n2ab and 11ab are like terms, since in both cases the variables are the same, so the value would be the same.\r\n12x^2 and 5y^2 aren't like terms since x and y don't have to have the same value.\r\n12x^2 and 12x aren't like terms since in the first case the value is x*x and the second only x. These two values would only be the same if x was 1 or 0.	\N	\N	\N	\N	\N	\N
64	6	7	In each of the following, use appropriate algebraic operations to remove the parentheses and combine like terms. Leave your answers in a simple form.\r\n(a) x(2x) + 2(x + 5) (b) 2x(5x − 2) + 3(6x + 7) (c) 5m(3m − 2n) + 4n(3m − 2n)		2014-07-10 18:34:18.355488	2014-07-10 18:34:18.355488	a) 2x^2 + 2x +10\r\nb) 10x^2 - 4x + 18x + 21 -> 10x^2 + 14x + 21\r\nc) 15m^2 - 10mn + 12mn - 8n^2 -> 15m^2 + 2mn - 8n^2\r\n	\N	\N	\N	\N	\N	\N
65	7	7	True or false, with justification: 7/12 + 11/12 + 1/12 + 19/12 is equivalent to 1/12(7+11+1+19).\r\n		2014-07-10 18:38:34.181781	2014-07-10 18:38:34.181781	True, if 1/12 is distributed over the 4 values the first statement results.\r\nOr, in both cases the value is 38/12, first by sum of fractions, second by taking 1/12 of 38.	\N	\N	\N	\N	\N	\N
66	8	7	Jess has just finished telling Lee about learning a wonderful new algebra trick: 3+5x can be simplified very neatly to just 8x, because a + bx is the same as (a + b)x. Now Lee has to break some bad news to Jess. What is it?		2014-07-10 18:40:00.840733	2014-07-10 18:40:00.840733	(a + b)x when distributed comes out to ax + bx, not a + bx.	\N	\N	\N	\N	\N	\N
67	9	7	Find whole numbers m and n that fit the equation 3m + 6n = 87. Is it possible to find whole numbers m and n that fit the equation 3m + 6n = 95? If so, find an example. If not, explain why not.		2014-07-10 18:54:56.124471	2014-07-10 18:54:56.124471	3m + 6n = 87\r\n3*11 + 6*9 = 87\r\n3*9 + 6*10 = 87\r\n3*7 + 6*11 = 87\r\n3*5 + 6*12 = 87\r\n\r\nCan't make 95 as any number times 3 subtracted from 87 will leave a number not divisible by 6, i.e. 92,89,86,83,80,77,74, 71,68,65,62,59,56m etc, the even result is always 1 less than a number divisible by 6.	\N	\N	\N	\N	\N	\N
68	10	7	If m and n stand for integers, then 2m and 2n stand for even integers. Explain. Use the distributive property to show that the sum of any two even numbers is even.		2014-07-10 18:56:00.096193	2014-07-10 18:56:00.096193	2m + 2n = 2(m + n). Any number times two is even.	\N	\N	\N	\N	\N	\N
69	11	7	(Continuation) Show that the sum of any two odd numbers is even.		2014-07-10 18:59:30.976228	2014-07-10 18:59:30.976228	m and n are even.\r\nTherefore m+1 and n+1 are odd.\r\nm + 1 + n + 1 = m + n + 2\r\nThe sum of two even numbers + 2 is also even as it is the sum of 3 even numbers.	\N	\N	\N	\N	\N	\N
70	12	7	Solve 9x + 2 = 3/4(2x + 11).		2014-07-10 19:08:07.829311	2014-07-10 19:08:07.829311	9x + 2 = 3/4(2x + 11)\r\n36x + 8 = 3(2x + 11)\r\n36x + 8 = 6x + 33\r\n-6x      -6x\r\n30x + 8 = 33\r\n    - 8   -8\r\n30x = 25\r\nx = 25/30\r\nx = 5/6\r\n\r\ncheck:\r\n9(5/6) + 2 = 3/4(2(5/6) + 11)\r\n45/6 + 12/6 = 3/4(10/6 + 66/6)\r\n57/6 = 3/4(76/6)\r\n57/6 = 228/24\r\n57/6 = 57/6	\N	\N	\N	\N	\N	\N
71	1	8	The distributive property states that (−1)x + 1x is the same as (−1 + 1)x, and this is 0. It follows that (−1)x is the same as −x. Explain why, then use similar reasoning to explain why (−x)y is the same as −(xy). By the way, is it correct to say, “−x is a negative number”?		2014-07-10 19:15:29.213407	2014-07-10 19:15:29.213407	Since x + (-x)  = 0, -x must be the same as (-1)x.\r\n(-x)y = (-1)xy = -xy\r\nIt is not correct to refer to -x as the value of x might be negative, in which case -x would be positive.	\N	\N	\N	\N	\N	\N
72	2	8	Simplify the expression k −2(k −(2−k))−2 by writing it without using parentheses.		2014-07-10 19:19:39.567314	2014-07-10 19:19:39.567314	k −2(k −(2−k))−2\r\nk -2(k -2 +k) -2\r\nk -2(2k - 2) - 2\r\nk -4k + 4 -2\r\n-3k + 2	\N	\N	\N	\N	\N	\N
73	3	8	Last year the price of an iPod was $240.\r\n(a) This year the price increased to $260. By what percent did the price increase?\r\n(b) If the price next year were 5% more than this year’s price, what would that price be?\r\n(c) If the price dropped 5% the year after that, show that the price would not return to\r\n$260. Explain the apparent paradox.		2014-07-10 19:30:40.506845	2014-07-10 19:30:40.506845	a) $260/240 = 1.08333, 8.3%\r\nb) $260*1.05 = 273$\r\nc) $273*.95 = $259.35\r\nYou are taking 5% off of a larger value on the decrease, so the amount the price goes down is greater.	\N	\N	\N	\N	\N	\N
74	4	8	During a recent episode of Who Wants to Be a Billionaire, your friend Terry called you, needing help with solving the equation 5x+1 = 2x+7. Write down the step-by-step instructions you would give Terry over the phone.		2014-07-10 19:36:23.939994	2014-07-10 19:36:23.939994	 5x+1 = 2x+7  1) subtract 2x from both sides\r\n-2x     2x    2) this puts all the x's on the left side\r\n 3x+1 = 7     3) now subtract 1 from both sides\r\n   -1  -1     4) this puts all the numbers on the right side\r\n 3x = 6       5) now divide both sides by 3 to get a single x on the left\r\n  x = 6/3     6) simplify 6/3 to 2\r\n  x = 2       7) q.e.d\r\n\r\nCheck:\r\n5x+1 = 2x+7\r\n10+1 = 4+7\r\n11 = 11	\N	\N	\N	\N	\N	\N
75	5	8	Which number is closer to zero, −4/5 or 5/4?		2014-07-10 19:37:43.093038	2014-07-10 19:37:43.093038	-4/5 is only .8 away from zero while 5/4 is 1.25 away from zero.	\N	\N	\N	\N	\N	\N
76	6	8	Several Preps were meeting in a room. After 45 of them left, the room was 5/8 as full as it was initially. How many Preps were in the room at the start of the meeting?		2014-07-10 19:40:24.623644	2014-07-10 19:40:24.623644	3/8x = 45\r\nx = 45*8/3\r\nx = 8 * 15\r\nx = 120\r\n	\N	\N	\N	\N	\N	\N
79	9	8	On a number line, what number is halfway between (a) −4 and 11? (b) m and n?	Assuming m in less than n	2014-07-10 22:18:50.361319	2014-07-10 22:18:50.361319	a) 3.5\r\nb) m + (m-n)/2	\N	\N	\N	\N	\N	\N
80	10	8	Coffee beans lose 12.5% of their weight during roasting. In order to obtain 252 kg of roasted coffee beans, how many kg of unroasted beans must be used?		2014-07-10 22:21:20.821921	2014-07-10 22:21:20.821921	0.875x = 252\r\n\r\nx = 288	\N	\N	\N	\N	\N	\N
81	11	8	The product of two negative numbers is always a positive number. How would you explain this rule to a classmate who does not understand why the product of two negative numbers must be positive?		2014-07-10 22:34:06.996566	2014-07-10 22:34:06.996566	1 - (-1) = 2  Multiplication can be thought of as successive addition, i.e. 3*2 = 2+2+2\r\nSo -3 * -2 is like -(-2-2-2). We combine 3 -2s, but since we're combining them not 3, but -3 times, we multiply the final result by -1 because -3 = (-1)*3.	\N	\N	\N	\N	\N	\N
82	1	9	Temperature is measured in both Celsius and Fahrenheit degrees. These two systems are of course related: the Fahrenheit temperature is obtained by adding 32 to 9/5 of the Celsius temperature. In the following questions, let C represent the Celsius temperature and F the Fahrenheit temperature.\r\n(a) Write an equation that expresses F in terms of C.\r\n(b) Use this equation to find the value of F that corresponds to C = 20.\r\n(c) On the Celsius scale, water freezes at 0◦ and boils at 100◦. Use your formula to find\r\nthe corresponding temperatures on the Fahrenheit scale. Do you recognize your answers?\r\n(d) A quick way to get an approximate Fahrenheit temperature from a Celsius temperature\r\nis to double the Celsius temperature and add 30. Explain why this is a good approximation.\r\nConvert 23◦ Celsius the quick way. What is the difference between your answer and the\r\ncorrect value? For what Celsius temperature does the quick way give the correct value?		2014-07-10 22:45:03.906362	2014-07-10 22:45:03.906362	a) F = (9/5)C + 32\r\nb) F = (9/5)20 + 32\r\n   F = 68\r\nc) F = (9/5)0 + 32, F = 32, freezing\r\n   F = (9/5)100 + 32, F= 180+32, F = 212, boiling\r\nd) Since 9/5 is a little less than doubling, we add a little less than 32.\r\n   76 F\r\n   (9/5)23 + 32, 73.4\r\n   \r\n   (9/5)x +32 = 2x + 30\r\n9x + 160 = 10x + 150\r\n       x = 10\r\n\r\ncheck:\r\n(9/5)10+32 = 50\r\n2*10 + 30  = 50\r\n\r\n\r\nF = (	\N	\N	\N	\N	\N	\N
83	2	9	You measure your stride and find it to be 27 inches. If you were to walk to Newfields, a town 4.5 miles north of Exeter, how many steps would you have to take? Remember that there are 12 inches in a foot, 3 feet in a yard, and 5280 feet in a mile.		2014-07-11 20:57:06.160869	2014-07-11 20:57:06.160869	4.5 * 5280 * 12 = 285,120 inches\r\ndivided by 27 = 10,560 steps\r\n\r\n\r\n	\N	\N	\N	\N	\N	\N
84	3	9	The Millers must make a 70-mile Thanksgiving trip to visit their grandparents. Pat Miller believes in driving at a steady rate of 50 miles per hour.\r\n(a) With Pat in the driver’s seat, how much time will the trip take?\r\n(b) How many miles will the Millers travel in 18 minutes?\r\n(c) Write an expression for the number of miles they will cover in t minutes of driving.\r\n(d) After t minutes of driving, how many miles remain to be covered?		2014-07-11 21:03:40.616673	2014-07-11 21:03:40.616673	a) 70/50 = 1.4 hours or 84 minutes\r\nb) 50/60 * 18 = 15 miles\r\nc) 5/6t\r\nd) 70-5/6t\r\n\r\ncheck:\r\n5/6*84 = 70	\N	\N	\N	\N	\N	\N
97	4	11	Solve for x: (a) 2(x − 1) = 3(x + 2) (b) −4(2x − 2) = 3(x + 1)		2014-07-12 15:00:19.726291	2014-07-12 15:00:19.726291	(a) 2(x − 1) = 3(x + 2)   ->   2x-2 = 3x + 6    ->  -x = 8    ->  x = -8\r\n(b) −4(2x − 2) = 3(x + 1) ->   -8x + 8 = 3x + 3 ->  11x = 5   ->  x = 5/11\r\n\r\nCheck:\r\na) 2(-8 -1) = 3(-8 + 2) ->  -18 = -18\r\nb) -4(10/11 - 2) = 3(5/11 + 1) -> -40/11 + 8 = 15/11 + 3  -> -40/11 + 88/11 =  15/11 + 33/11  ->  48/11 = 48/11	\N	\N	\N	\N	\N	\N
98	5	11	There are three feet in a yard. Find the number of feet in 5 yards. Find the number of yards in 12 feet. Find the number of feet in y yards. Find the number of yards in f feet.		2014-07-12 15:02:20.567175	2014-07-12 15:02:20.567175	5 yards = 15 feet\r\n12 feet = 4 yards\r\ny yards = 3y feet\r\nf feet = f/3 yards	\N	\N	\N	\N	\N	\N
78	8	8	Often it is necessary to rearrange an equation so that one variable is expressed in terms of others. For example, the equation D = 3t expresses D in terms of t. To express t in terms of D, divide both sides of this equation by 3 to obtain D/3 = t.\r\n(a) Solve the equation C = 2r for r in terms of C.\r\n(b) Solve the equation p = 2w + 2h for w in terms of p and h.\r\n(c) Solve the equation 3x − 2y = 6 for y in terms of x.		2014-07-10 22:15:41.388913	2014-08-18 17:27:58.355766	a) C = 2r. r = C/2\r\nb) p = 2w + 2h. w = (p - 2h)/2\r\nc) 3x − 2y = 6, -2y = 3x + 6, y = (3x + 6)/-2\r\n	\N	\N	\N	\N	\N	\N
86	5	9	Solve for x: (a) 3x − 4 = 11 (b) −2x + 5 = −1 (c) ax + b = c\r\n		2014-07-11 21:15:05.078364	2014-07-11 21:15:05.078364	(a) 3x − 4 = 11    3x = 15     x = 5\r\n(b) −2x + 5 = −1   -2x = -6    x = 3\r\n(c) ax + b = c     ax = c - b  x = (c - b)/a	\N	\N	\N	\N	\N	\N
85	4	9	The length of a certain rectangle exceeds its width by exactly 8 cm, and the perimeter of the rectangle is 66 cm. What is the width of the rectangle? Although you may be able to solve this problem using a method of your own, try the following approach, which starts by guessing the width of the rectangle. Study the first row of the table below, which is based on a 10-cm guess for the width. Then make your own guess and use it to fill in the next row of the table. If you have not guessed the correct width, use another row of the table and try again.\r\n\r\nguess    length            perimeter       target      check?\r\n10     10 + 8 = 18    2(10) + 2(18) = 56     66          no		2014-07-11 21:10:42.465035	2014-07-11 21:17:11.817254	guess    length            perimeter       target      check?\r\n10     10 + 8 = 18    2(10) + 2(18) = 56     66          no\r\n12     12 + 8 = 20    2(12) + 2(20) = 64     66          no\r\n13     13 + 8 = 21    2(13) + 2(21) = 68     66          no\r\n12.5 12.5 + 8 = 20.5 2(12.5) + 2(20.5) = 66  66          yes\r\nw        w + 8           2w + 2(w+8)\r\n\r\n2w + 2(w+8) = 66\r\n4w + 16 = 66\r\n4w = 50\r\nw = 12.5	\N	\N	\N	\N	\N	\N
87	1	10	Number-line graphs. Observe the following conventions, which may already be familiar:\r\n• To indicate an interval on the number line, thicken that part of the number line.\r\n• To indicate that an endpoint of an interval is included, place a solid dot on the number.\r\n• To indicate that an endpoint is not included, place an open circle on the number. For example, the diagram illustrates those numbers that are greater than −2 and less than or equal to 3.\r\n\r\n----------o===========*--------------\r\n         -2           3\r\n\r\nDraw a number line for each of the following and indicate the numbers described:\r\n(a) All numbers that are exactly two units from 5.\r\n(b) All numbers that are more than two units from 5.\r\n(c) All numbers that are greater than −1 and less than or equal to 7.\r\n(d) All numbers that are less than four units from zero.		2014-07-11 21:26:45.569136	2014-07-11 21:27:33.575239	a.  ---------------*------------*--------------\r\n                   3     5      7\r\n\r\nb.=================o------------o==============\r\n                   3     5      7\r\n\r\nc. -------------o===============*--------------\r\n               -1               7\r\n\r\nd.----------o=================o--------------\r\n           -4        0        4\r\n  	\N	\N	\N	\N	\N	\N
88	2	10	Percent practice: \r\n(a) 25% of 200 is what number? \r\n(b) 200 is 25% of what number?\r\n(c) Express 2/25 as a decimal; as a percent. \r\n(d) Express 24% as a decimal; as a fraction.		2014-07-11 21:29:48.993673	2014-07-11 21:29:48.993673	a) 50\r\nb) 800\r\nc) 0.08, 6%\r\nd) 0.24, 24/100	\N	\N	\N	\N	\N	\N
89	3	10	At West Point, the “plebe” (first year cadet) who brings dessert to the table must divide it into pieces that are exactly the size requested by the cadets at the table. One night, the two seniors assigned to the table requested 1/6 of the pie and 1/5 of the pie, respectively. How much of the pie did that leave for the younger cadets?		2014-07-11 21:32:57.967024	2014-07-11 21:32:57.967024	1/6 + 1/5 = 5/30 + 6/30 = 11/30\r\n\r\n19/30 remain	\N	\N	\N	\N	\N	\N
90	4	10	Ryan earns x dollars every seven days. Write an expression for how much Ryan earns in one day. Ryan’s spouse Lee is paid twice as much as Ryan. Write an expression for how much Lee earns in one day. Write an expression for their combined daily earnings.		2014-07-11 21:35:05.402577	2014-07-11 21:35:05.402577	x/7\r\n2x/7\r\n3x/7	\N	\N	\N	\N	\N	\N
91	5	10	Solve for x: (a) 2(x − 3) = 4 (b) −3(2x + 1) = 5 (c) a(bx + c) = d		2014-07-11 21:41:17.728061	2014-07-11 21:41:17.728061	a) 2x - 6 = 4, 2x = 10, x = 5\r\nb) -6x - 3 = 5, -6x = 8, x = -8/6, x = -4/3\r\nc) abx + ac = d, abx = d - ac, x = (d - ac)/ab	\N	\N	\N	\N	\N	\N
92	6	10	Day student Avery just bought 10 gallons of gasoline, the amount of fuel used for the last 355 miles of driving. Being a curious sort, Avery wondered how much fuel had been used in city driving (which takes one gallon for every 25 miles) and how much had been used in freeway driving (which takes one gallon for each 40 miles). Avery started by guessing 6 gallons for the city driving, then completed the first row of the guess-and-check table below. Notice the failed check. Make your own guess and use it to fill in the next row of the table.\r\n\r\ncity g     freeway g      city mi      freeway mi      total mi       target      check\r\n   6       10 - 6 = 4   6(25) = 150   4(40) = 160   150 + 160 = 310    355         no\r\n\r\nNow write c in the city-gallon column, fill in the remaining entries in terms of c, and\r\nset your expression for the total mileage equal to the target mileage. Solve the resulting\r\nequation.		2014-07-11 22:02:17.528748	2014-07-11 22:02:17.528748	city g     freeway g      city mi      freeway mi      total mi       target      check\r\n   6       10 - 6 = 4   6(25) = 150   4(40) = 160   150 + 160 = 310    355         no\r\n   4       10 - 4 = 6   4(25) = 100   6(40) = 240   100 + 240 = 340    355         no\r\n   3       10 - 4 = 7   3(25) =  75   7(40) = 280    75 + 280 = 355    355         yes\r\n   c       10 - c           25c         40(10-c)     25c + 40(10-c) =  355\r\n\r\n25c + 40(10-c) =  355\r\n25c - 40c + 400 = 355\r\n-15c = 355-400\r\n15c = 45\r\nc = 3	\N	\N	\N	\N	\N	\N
93	7	10	On a number line, graph all numbers that are closer to 5 than they are to 8.		2014-07-11 22:06:26.135954	2014-07-11 22:06:26.135954	=====|=====|=====|=====|=====|=====|=====|==o--|-----|-----|\r\n     0     1     2     3     4     5     6     7     8     9	\N	\N	\N	\N	\N	\N
94	1	11	Remy walked to a friend’s house, m miles away, at an average rate of 4 mph. The m-mile walk home was at only 3 mph, however. Express as a fraction \r\n(a) the time Remy spent walking home;\r\n(b) the total time Remy spent walking.		2014-07-11 22:10:08.418859	2014-07-11 22:10:08.418859	a) m/3\r\nb) m/3 + m/4 -> 7m/12	\N	\N	\N	\N	\N	\N
77	7	8	The figure shows some more algebra blocks. The 1-by-1 square is called a unit block, or a 1-block. Below the 1-block is a representation of x + 2, formed from an x-block and two 1-blocks. Draw a diagram using the appropriate number of x-blocks and 1-blocks to illustrate the distributive propertry 3(x + 2) = 3x + 6.\r\n\r\n  XXX\r\n1 X X\r\n  XXX\r\n\r\n  XXXXXXXXXXXXXXXX\r\n1 X          | | X\r\n  XXXXXXXXXXXXXXXX\r\n        x     1 1		2014-07-10 22:09:32.729486	2014-07-12 05:28:32.839746	  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         | | XX         | | X X         | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x+2            x+2            x+2          3(x + 2)\r\n\r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n1 X         XX         X X         | | | | | | X  \r\n  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n       x          x           x     1 1 1 1 1 1   3x + 6\r\n \r\n	\N	\N	\N	\N	\N	\N
95	2	11	The sum of four consecutive integers is 2174. What are the integers?		2014-07-12 14:30:54.340535	2014-07-12 14:30:54.340535	x+x+1+X+2+x+3 = 2174\r\n4x + 6 = 2174\r\n4x = 2168\r\nx = 542\r\n\r\n542,543,544,545	\N	\N	\N	\N	\N	\N
96	3	11	(Continuation) The smallest of four consecutive integers is n. What expression represents the next larger integer? Write an expression for the sum of four consecutive integers, the smallest of which is n. Write an equation that states that the sum of four consecutive integers is s. Solve the equation for n in terms of s. Check that your answer to the previous question satisfies this equation by considering the case s = 2174.		2014-07-12 14:50:03.722575	2014-07-12 14:50:03.722575	4n + 6 = s\r\n\r\n4(542) + 6 = 2174	\N	\N	\N	\N	\N	\N
99	6	11	Sam and Cam have a lawn-mowing service. Their first job tomorrow morning is one that usually takes Sam 40 minutes to do alone, or Cam 30 minutes to do alone. This time they are going to team up, Sam starting at one side and Cam at the other side. The problem is to predict how many minutes it will take them to finish the job. What part of the lawn will Sam complete in the first ten minutes? What part of the lawn will Cam complete in the first ten minutes? What part of the lawn will the team complete in ten minutes? Set up a guess-and-check table with columns titled “minutes”, “Sam part”, “Cam part” and “Team part”. What is the target value for the team part? Fill in two rows of the chart by making guesses in the minutes column. Then guess m and complete the solution algebraically.	 	2014-07-12 15:17:31.626605	2014-07-12 15:17:31.626605	Minutes     Sam Part       Cam Part      Team Part     Target    Met?\r\n10          10/40->3/12     10/30->4/12     7/12         1        no\r\n18          18/40=>9/20     18/30->12/20   21/20         1        no\r\nGuess- 17 minutes\r\n\r\nm/40 + m/30 = 1 ->  30m/1200 + 40m/1200 = 1  ->  70m = 1200  ->   7m = 120  ->  m = 120/7  ->   17 1/7      	\N	\N	\N	\N	\N	\N
100	7	11	Write an expression that represents the number that\r\n(a) is 7 more than x; (b) is 7 less than x; (c) is x more than 7;\r\n(d) exceeds x by 7; (e) is x less than 7; (f) exceeds 7 by x.	Exposing students to multiple forms of expression for converting English to algebraic form	2014-07-12 15:20:05.287577	2014-07-12 15:20:05.287577	a) x + 7\r\nb) x - 7\r\nc) 7 + x\r\nd) x + 7\r\ne) 7 - x\r\nf) 7 + x	\N	\N	\N	\N	\N	\N
101	8	11	The x2-block, shown at right, is another member of the algebra-block family. Draw an algebra-block diagram that shows that x(x+2) = x^2+2x.\r\n\r\n   XXXXXXXXX \r\n   X       X\r\n x X       X\r\n   X       X\r\n   XXXXXXXXX\r\n       x		2014-07-12 15:32:13.211311	2014-07-12 15:32:13.211311	  \r\n   XXXXX   XXXXXXXXX         XXXXX   XXXXX  XXXXX \r\n 1 X   X * X   | | X   ->    X   X 1 X   X  X   X \r\n   XXXXX   XXXXXXXXX       x X   X   XXXXX  XXXXX\r\n     x       x  1 1          X   X     x      x \r\n                             XXXXX\r\n                               x	\N	\N	\N	\N	\N	\N
103	10	11	On a number line, graph a number that is twice as far from 5 as it is from 8. How many such numbers are there?	Twice as far can be either right or left on the number line.	2014-07-12 15:41:52.694322	2014-07-12 15:56:32.247213	---|---------|---------|---------|---------|---------|---------|---------|---------*---------|---------|---------|---------*---------|---------|---------|---------\r\n  -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\nn - 5 = 2(n - 8)\r\nn - 5 = 2n - 16\r\n-n - 5 = 2n - 16\r\nn = 11, 7	\N	\N	\N	\N	\N	\N
110	7	12	One of the PEA interscholastic teams has started its season badly, winning 1 game, losing 6, and tying none. The team will play a total of 25 games this season. \r\n(a) What percentage of the seven games played so far have been wins?\r\n(b) Starting with its current record of 1 win and 6 losses, what will the cumulative winning percentage be if the team wins the next 4 games in a row?\r\n(c) Starting with its current record of 1 win and 6 losses, how many games in a row must the team win in order for its cumulative winning percentage to reach at least 60%?\r\n(d) Suppose that the team wins ten of its remaining 18 games. What is its final winning percentage?\r\n(e) How many of the remaining 18 games does the team need to win so that its final winning percentage is at least 60%? Is it possible for the team to have a final winning\r\npercentage of 80%? Explain.		2014-07-12 17:09:34.557035	2014-07-12 17:09:34.557035	a) 14.29%\r\nb) 41.67%\r\nc) (w+1)/w+7 = 6/10 -> w + 1 = (6w+42)/10  -> 10w + 10 = 6w + 42 -> 4w = 32 -> w = 8 , must win at least 8 games. Check- new record 9/15 = .6\r\nd) 44%\r\ne) 14 of the remaining games would give a final winning percentage of 60% ( 15 w, 10 l). The highest percentage they could get would be 76% from the resulting 19 w, 6 l season.	\N	\N	\N	\N	\N	\N
104	1	12	Intervals on a number line are often described using the symbols < (“less than”), > (“greater than”), ≤ (“less than or equal to”), and ≥ (“greater than or equal to”). As you graph the following inequalities, remember the endpoint convention regarding the use of the dot • and the circle ◦ for included and excluded endpoints, respectively:\r\n(a) x < 5 (b) x ≥ −6 (c) −12 ≥ x (d) 4 < x < 8 (e) x < −3 or 7 ≤ x		2014-07-12 15:57:46.745006	2014-07-12 16:08:27.550754	Number Lines:\r\na) ===|=========|=========|=========|=========|=========|=========o---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\nb) ---*=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========||=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nc) ===|=========|=========|=========*---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n    -15       -14        -13       -12       -11       -10       -9        -8        -7        -6        -5        -4        -3        -2        -1          \r\n3\r\nd) ---|---------|---------|---------|---------|---------o=========|=========|=========|=========o---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\ne) ===|=========|=========|=========|=========o---------|---------|---------|---------*=========|=========|=========|=========|=========|=========|=========|=========\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n\r\n\r\n	\N	\N	\N	\N	\N	\N
105	2	12	Solve the equation A = P + Prt for r. Solve the equation A = P + Prt for P.		2014-07-12 16:11:31.394673	2014-07-12 16:11:31.394673	A = P + Prt\r\nPrt = A - P\r\nr = (A - P)/Pt\r\n\r\nA = P + Prt\r\nA = P(1 + rt)\r\nP = A/(rt + 1)	\N	\N	\N	\N	\N	\N
106	3	12	Using a number line, describe the location of (x + y)/2 in relation to the locations of x and y. Is your answer affected by knowing whether x and y are positive or not?		2014-07-12 16:24:22.925955	2014-07-12 16:24:22.925955	a) ---|---------|---------|---------|----*----|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------\r\n     -1         0         1         2         3         4         5         6         7         8         9        10        11        12        13        13 \r\n                                    x         y                  x+y\r\n\r\nYes, the answer is affected by knowing if x and y are positive or negative since values on the number line are based on the distance from 0 either left or right, and without knowing the sign of the number you can't know which way to go.	\N	\N	\N	\N	\N	\N
108	5	12	Evaluate the formula 36y + 12f + i when y = 2,5, f = 2, and i = 5. Find an interpretation for this formula.		2014-07-12 16:48:06.392634	2014-07-12 16:48:06.392634	36y + 12f + i\r\n36*2.5 + 12*2 + 5 = 90 + 24 + 5 = 119\r\n\r\nConvert a distance given in yards, feet, inches to inches.	\N	\N	\N	\N	\N	\N
109	6	12	The indicator on the oil tank in my home indicated that the tank was one-eighth full. After a truck delivered 240 gallons of oil, the indicator showed that the tank was half full. What is the capacity of the oil tank, in gallons?		2014-07-12 16:51:12.263404	2014-07-12 16:51:12.263404	3c/8 = 240\r\n3c =  1920\r\nc = 640 gallons	\N	\N	\N	\N	\N	\N
184	8	21	The diagram shows the last member of the algebra-block family, the y2-block. Show how an xy-block and a y2-block can be combined to illustrate the equation (x + y)y = xy + y2.		2014-07-17 16:15:15.607042	2014-07-17 16:15:15.607042	  XXXXXXXXX\r\n  X   |   X\r\ny X   |   X\r\n  X   |   X\r\n  XXXXXXXXX\r\n    y   x\r\nAcross the bottom we have x + y, and on the vertical we have y. To get the area we multiply the two. So the total area of the two blocks will be y*2 + xy	\N	\N	\N	\N	\N	\N
309	13	32	Write an equation for each of the graphs shown at right. Each graph goes through several lattice points.		2014-07-29 07:34:33.468182	2014-10-21 14:27:11.32501	On the left, y = |x|\r\nOn the right, y = |x - 3|	PBL_graph_32_13.PNG	\N	y = |x|,  y = |x-3|	Maya	Christian	1
111	8	12	Graph on a number line the intervals described below:\r\n(a) All numbers that are greater than 1 or less than −3.\r\n(b) All numbers that are greater than −5 and less than or equal to 4.\r\n(c) All numbers whose squares are greater than or equal to 1.		2014-07-12 17:10:01.542999	2014-07-12 17:16:45.12103	a) ===|=========|=========|=========o---------|---------|---------|---------o=========|=========|=========|=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nb) ---|---------o=========|=========|=========|=========|=========|=========|=========|=========|=========*---------|---------|---------|---------\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\nc) ---|=========|=========|=========|=========|=========*---------|---------*=========|=========|=========|=========||=========|=========|=========|========\r\n     -6        -5        -4        -3        -2        -1         0         1         2         3         4         5         6         7          \r\n\r\n	\N	\N	\N	\N	\N	\N
112	9	12	Use mathematical notation to represent the intervals described below.\r\n(a) All numbers that are greater than 1 or less than −3.\r\n(b) All numbers that are greater than −5 and less than or equal to 4.\r\n(c) All numbers whose squares are greater than or equal to 1.\r\nJuly		2014-07-12 17:19:02.153133	2014-07-12 17:20:58.078678	a) x > 1 or x < -3\r\nb) -5 < x ≤ 4\r\nc) x ≤ -1 or x ≥ 1\r\n\r\n	\N	\N	\N	\N	\N	\N
113	1	13	Randy and Sandy have a total of 20 books between them. After Sandy loses three by leaving them on the bus, and some birthday gifts double Randy’s collection, their total increases to 30 books. How many books did each have before these changes?		2014-07-12 17:27:17.679737	2014-07-12 17:27:17.679737	s-3+2r = 30\r\ns + r  = 20\r\nr - 3 = 10\r\nr = 13, s = 7\r\n\r\nCheck: 13+7 = 20,  13*2+(7-3) = 30\r\n\r\n\r\n\r\n	\N	\N	\N	\N	\N	\N
114	2	13	Combine the following fractions into a single fraction. Express each of your answers in lowest terms.\r\n(a) 27/5 + 3y/4\r\n(b) 4m/5 − 2/3\r\n(c) 2 + x/3\r\n(d) x/2 + 2x/3 − 3x/4		2014-07-12 17:44:16.442258	2014-07-12 17:44:16.442258	a) (108 + 15y)/20\r\nb) (12m-10)/15\r\nc) (x + 6)/3\r\nd) (6x+8x-9x)/12 -> 5x/12	\N	\N	\N	\N	\N	\N
115	3	13	Solve the following for x:\r\n(a) 4 − (x + 3) = 8 − 5(2x − 3) (b) x − 2(3 − x) = 2x + 3(1 − x)		2014-07-12 19:50:20.586958	2014-07-12 19:50:20.586958	a) 4 − (x + 3) = 8 − 5(2x − 3) -> 4 - x - 3 = 8 - 10x + 15  ->  1 - x = -10x + 23  ->  9x = 22   ->  x = 22/9\r\nb) x − 2(3 − x) = 2x + 3(1 − x)  -> x - 6 + x = 2x + 3 - 3x   ->   2x - 6 = -x + 3   ->   3x = 9   ->  x = 3 \r\n\r\nCheck:\r\na) 4 - (22/9 +3) = 8 - 5(44/9 - 3) ->  4 - 22/9 - 3 = 8 - 220/9 + 15 -> 1 - 22/9 = 23 - 220/9 -> 9/9 - 22/9 = 207/9 - 220/9  ->  -13/9 = -13/9\r\nb) 3 - 2(3 - 3) = 2*3 + 3(1 - 3) ->   = 3 - 6 + 3 = 6 + 3 - 9 -> 0 = 0	\N	\N	\N	\N	\N	\N
116	4	13	Guessing birthdays. Pat is working a number trick on Kim, whose birthday is the 29th of February. The table below shows the sequence of questions that Pat asks, as well as the calculations that Kim makes in response. Another column is provided for the algebra you are going to do to solve the trick. Use the letters m and d for month and day.\r\nInstruction                               Kim   Algebra\r\nWrite the number of your birthmonth         2       m\r\nMultiply by 5                              10       \r\nAdd 7                                      17\r\nMultiply by 4                              68\r\nAdd 13                                     81\r\nMultiply by 5                             405\r\nAdd the day of the month of your birthday 434\r\nAfter hearing the result of the last calculation, Pat can do a simple mental calculation and then state Kim’s birthday. Explain how. To test your understanding of this trick, try it on someone whose birthday is unknown to you.		2014-07-12 19:57:52.137595	2014-07-12 19:57:52.137595	Instruction                               Kim   Algebra\r\nWrite the number of your birthmonth         2       m\r\nMultiply by 5                              10      5m  \r\nAdd 7                                      17    5m + 7\r\nMultiply by 4                              68    20m + 28\r\nAdd 13                                     81    20m + 41\r\nMultiply by 5                             405   100m + 205\r\nAdd the day of the month of your birthday 434   100m + 205 + d\r\n\r\nSubtract 2 from the hundreds place to get the number of the month and 5 from the rest to get the day of the month. 	\N	\N	\N	\N	\N	\N
118	6	13	I am thinking of n consecutive positive integers, the smallest of which is m. What formula represents the largest of these integers?		2014-07-12 20:24:15.418447	2014-07-12 20:24:15.418447	m + n - 1\r\n\r\nCheck: 6 consecutive integers starting with 5 -> 5,6,7,8,9,10 -> 5 + 6 - 1 = 10	\N	\N	\N	\N	\N	\N
119	7	13	Place a common mathematical symbol between the numerals 2 and 3, so as to produce a number that lies between 2 and 3 on a number line.		2014-07-12 20:28:16.632174	2014-07-12 20:28:16.632174	2.3	\N	\N	\N	\N	\N	\N
123	4	14	What is the average daily change of sunset time during the month of September?		2014-07-13 22:05:05.791301	2014-07-24 16:39:43.097443	1.7 minutes per day	PBL_Graph_14_1_6.PNG	\N	\N	\N	\N	\N
126	1	15	A flat, rectangular board is built by gluing together a number of square pieces of the same size. The board is m squares wide and n squares long. Using the letters m and n, write expressions for\r\n(a) the total number of 1 × 1 squares;\r\n(b) the total number of 1 × 1 squares with free edges (the number of 1 × 1 squares that are not completely surrounded by other squares);\r\n(c) the number of completely surrounded 1 × 1 squares;\r\n(d) the perimeter of the figure.		2014-07-13 22:19:03.07922	2014-07-13 22:19:03.07922	a) m*n\r\nb) 2m + 2n - 4\r\nc) (m-2)(n-2)\r\nd) 2m+2n\r\n	\N	\N	\N	\N	\N	\N
121	2	14	On what day does the sun set at 6:54? at 7:08? at 6:30?		2014-07-13 21:54:56.523493	2014-07-24 16:39:06.178011	6:54 = Sept. 15\r\n7:08 = Sept. 5\r\n6:30 = Sept. 28	PBL_Graph_14_1_6.PNG	\N	\N	\N	\N	\N
122	3	14	Guess the time of sunset on the 1st of October and on the 31st of August.		2014-07-13 22:00:51.719918	2014-07-24 16:38:31.573447	Oct. 1 = 6:24\r\nAug. 31 = 7:18	PBL_Graph_14_1_6.PNG	\N	\N	\N	\N	\N
125	6	14	What happens on the Autumnal Equinox, which is the 22nd of September? Guess what time the sun rises on this day.		2014-07-13 22:13:39.564568	2014-07-24 16:42:32.710832	There is an equal amount of night and day. 6:40 a.m.	PBL_Graph_14_1_6.PNG	\N	\N	\N	\N	\N
185	9	21	Which is greater, 73 percent of 87, or 87 percent of 73?		2014-07-17 16:20:53.164409	2014-07-17 16:20:53.164409	87 * .73 = 63.51\r\n73 * .87 = 63.51\r\nNeither is greater, they have to be the same since you are multiplying the same two numbers and you have the equivalent number of decimal places in both multiplications.\r\n	\N	\N	\N	\N	\N	\N
186	10	21	Corey deposits $300 in a bank that pays 4% annual interest. How much interest does Corey earn in one year? What would the interest be if the rate were 6%?		2014-07-17 16:23:15.157661	2014-07-17 16:23:15.157661	300 * .04 = $12 earned in one year.\r\n300 * .06 = #18.\r\n	\N	\N	\N	\N	\N	\N
127	2	15	Graph on a number line the intervals corresponding to these two signs on the highway.\r\n(a) The maximum speed is 65 mph and the minimum speed is 45 mph.\r\n(b) The maximum speed is 55 mph.		2014-07-14 03:48:19.019773	2014-07-14 03:51:48.425601	a) ---|---------|---------|---------|----*====|=========|====*----|---------\r\n     10        20        30        40        50        60        70   \r\n\r\nb) ===|=========|=========|=========|=========|====*----|---------|---------\r\n     10        20        30        40        50        60        70   	\N	\N	\N	\N	\N	\N
129	4	15	It is sometimes necessary to write fractions with variables in the denominator. Without using your calculator, rewrite each of the following as a single fraction. This is called combining over a common denominator.\r\n(a) 3/a + 7/a   (b) 3/a + 7/2a  (c) 3/a + 7/b   (d) 3 + 7/b\r\n		2014-07-14 04:00:49.48266	2014-07-14 04:00:49.48266	a) 10/a     b)  13/2a     c)    (3b + 7a)/ab    d) (3b + 7)/b	\N	\N	\N	\N	\N	\N
131	6	15	Ryan took 25 minutes to type the final draft of a 1200-word English paper. How much time should Ryan expect to spend typing the final draft of a 4000-word History paper?		2014-07-14 04:13:55.980067	2014-07-14 04:13:55.980067	1200/25 = 48 words per minute\r\n\r\n4000/48 = 160 minutes, or 2 hours and 40 minutes\r\n	\N	\N	\N	\N	\N	\N
132	7	15	Which of the following seven expressions does not belong in the list?\r\na − b + c     c − b + a      c − (b − a)     −b + a + c     a − (b − c)     b − (c − a)     a + c − b		2014-07-14 04:17:09.586508	2014-07-14 04:17:09.586508	-b + a + c\r\nNot in easy to read order, i.e. positive number first	\N	\N	\N	\N	\N	\N
133	8	15	Last week, Chris bought a DVD for $10.80 while the store was having a 25%-off sale. The sale is now over. How much would the same DVD cost today?		2014-07-14 04:19:06.66346	2014-07-14 04:19:06.66346	10.80/.75 = 14.40\r\n\r\nCheck = 14.40 * .75 = 10.80	\N	\N	\N	\N	\N	\N
134	9	15	Forrest is texting while driving along the freeway at 70 miles per hour. How many feet does the car travel during the 3-second interval when Forrest’s eyes are not on the road?		2014-07-14 04:22:08.157328	2014-07-14 04:22:08.157328	70 * 5280 = 369,600 feet per hour\r\n369,600/60 - 6,160 feet per minute\r\n6,160/60 = 102.67 feet per second\r\n102.67 * 3 = 308 feet\r\n	\N	\N	\N	\N	\N	\N
135	1	16	The statement “x is between 13 and 23” defines an interval using two simultaneous inequalities: 13 < x and x < 23. The statement “x is not between 13 and 23” also uses two inequalities, but they are non-simultaneous: x ≤ 13 or 23 ≤ x. Graph these two examples on a number line. Notice that there is a compact form 13 < x < 23 for only one of them.	Unclear whether to use o or *, depends on the meaning of between- inclusive or exclusive?	2014-07-14 04:23:19.106744	2014-07-14 04:30:11.39089	a) ---|---------|---------|---------|---------|---------|---------|---------|----o====|=========|=========|=========|=========|====o----|---------|---------|----\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28 \r\n\r\na) ===|=========|=========|=========|=========|=========|=========|=========|====*----|---------|---------|---------|---------|----*====|=========|=========|====\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28  \r\n \r\n 	\N	\N	\N	\N	\N	\N
136	2	16	Crossing a long stretch of the Canadian plains, passenger trains maintain a steady speed of 80 mph. At that speed, what distance is covered in half an hour? How much time is needed to cover 200 miles?\r\nFill in the missing entries in the table below, and plot points on the grid at right.\r\n\r\n         ---------------------------------------------------\r\ntime     | 0  | 1/2|    | 1  | 2  |    | 3  |    | 4  | t  | \r\n         |--------------------------------------------------\r\ndistance |    |    | 60 |    |    | 200|    | 300|    |    |\r\n         ---------------------------------------------------		2014-07-14 14:08:53.624029	2014-07-24 16:44:04.700416	         ---------------------------------------------------\r\ntime     | 0  | 1/2| 3/4| 1  | 2  | 2.5| 3  |3.75| 4  | t  | \r\n         |--------------------------------------------------\r\ndistance | 0  | 40 | 60 | 80 | 160| 200| 240| 300| 320| 80t|\r\n         ---------------------------------------------------	PBL_Graph_16_2_b.PNG	pbl_ans_16_2.PNG	\N	\N	\N	\N
187	11	21	Alex was hired to unpack and clean 576 very small items of glassware, at five cents per piece successfully unpacked. For every item broken during the process, however, Alex had to pay $1.98. At the end of the job, Alex received $22.71. How many items did Alex break?		2014-07-17 16:36:34.748211	2014-07-17 16:36:34.748211	(576 * .05) - (b*1.98+.05) = 22.71\r\n28.80 - (b * 2.03) = 22.71\r\nb * 2.03 = 28.80 - 22.71\r\nb * 2.03 = 6.09\r\nb = 3 items broken\r\n\r\ncheck = 573 * .05 = 28.65 - (3*1.98) = 22.71\r\n\r\n	\N	\N	\N	\N	\N	\N
124	5	14	The dots in the graph form a pattern. Jess thinks that this pattern continues into October, November, and December. What do you think? Make a graph that shows how the time of sunset at Exeter changes during an entire year. A good source for such data is the U.S. Naval Observatory site http://aa.usno.navy.mil.		2014-07-13 22:08:43.303651	2014-07-24 16:41:59.612219	The pattern most likely will continue until late in December, when the day switches from getting shorter to getting longer.	PBL_Graph_14_1_6.PNG	PBL_Ans_14_5.PNG	\N	\N	\N	\N
128	3	15	Label the figure at right so that it provides a geometric representation of x(x + 3). Notice that this question is about area.		2014-07-14 03:56:48.896917	2014-07-24 16:43:02.944371	  XXXXXXXXXXXXXXXXXXXX\r\n  X            | | | X                     \r\nx X            | | | X\r\n  X            | | | X\r\n  XXXXXXXXXXXXXXXXXXXX\r\n         x      1 1 1	PBL_Graph_15_3.PNG	\N	\N	\N	\N	\N
189	2	22	(Continuation) Plot the data from the tables in the previous question on the same set of axes and use a ruler to draw a line through each set of points. By looking at the graph, how could you recognize the direct variation? What similarities and differences are there between the two lines drawn?		2014-07-17 16:49:20.672517	2014-10-10 15:17:40.508074	Direct passes through (0,0) |\r\nBoth graphs form straight lines, only one passes through the origin, which indicates direct variation. The lines are parallel, but they cross the x axis at different values. (may)	\N	PBL_Graph_ans_22_2.PNG	Direct passes through (0,0)	Maya	Henry	1
137	3	16	The problems about the Exeter spring and the Canadian plains contain relationships that are called 'direct variations'. In your own words, describe what it means for one quantity to 'vary directly' with another. Which of the following describe direct variations?\r\n(a) The gallons of water in a tub and the number of minutes since the tap was opened.\r\n(b) The height of a ball and the number of seconds since it was thrown.\r\n(c) The length of a side of a square and the perimeter of the square.\r\n(d) The length of a side of a square and the area of the square.		2014-07-14 14:27:20.766099	2014-07-14 14:30:43.300066	When one value increases the other value increases, the rate of increase remains the same, i.e. for a given amount of increase in the first, the second will increase at whatever the relationship is between them. \r\n\r\na) direct, the amount of water coming out of the tap stays constant\r\nb) not direct, the ball will not go up forever (unless you're in space, in which case which way is up?)\r\nc) direct, doubling the length will double the perimeter, etc.\r\nd) not direct, the area increases faster as the square gets bigger	\N	\N	\N	\N	\N	\N
138	4	16	(Continuation) Sketch graphs for each of the situations described above. Be sure to include meaningful descriptions and scales for each axis.		2014-07-14 14:31:59.898292	2014-07-14 14:31:59.898292		\N	\N	\N	\N	\N	\N
139	5	16	Remy walked to a friend’s house, m miles away, at an average rate of 4 mph. The m-mile walk home was only at 3 mph. Remy spent 2 hours walking in all. Find the value of m.		2014-07-14 14:38:18.304586	2014-07-14 14:38:18.304586	m/4 + m/3 = 2\r\n3m/12 + 4m/12 = 2\r\n7m/12 = 2\r\n7m = 24\r\nm = 24/7\r\nm = 3 3/7\r\n\r\ncheck: (24/7)/4 = 6/7   (24/7)/3 = 8/7   6/7 + 8/7 = 14/7 = 2	\N	\N	\N	\N	\N	\N
140	6	16	The sides of a rectangle in the coordinate plane are parallel to the axes. Two of the vertices of the rectangle are (3;−2) and (−4;−7). Find coordinates for the other two vertices. Find the area of the rectangle.		2014-07-14 14:43:16.523082	2014-07-14 14:43:16.523082	(-4, -2), (3,-7)\r\narea is 35	\N	\N	\N	\N	\N	\N
143	1	17	Chandler was given $75 for a birthday present. This present, along with earnings from a summer job, is being set aside for a mountain bike. The job pays $6 per hour, and the bike costs $345. To be able to buy the bike, how many hours does Chandler need to work?		2014-07-14 15:01:38.233644	2014-07-14 15:01:38.233644	6h + 75 = 345\r\n6h = 270\r\nh = 45 hours	\N	\N	\N	\N	\N	\N
144	2	17	(Continuation) Let h be the number of hours that Chandler works. What quantity is represented by the expression 6h? What quantity is represented by the expression 6h+75?\r\n(a) Graph the solutions to the inequality 6h + 75 ≥ 345 on a number line.\r\n(b) Graph the solutions to the inequality 6h + 75 < 345 on a number line.\r\nWhat do the solutions to the inequality 6h + 75 ≥ 345 signify?		2014-07-14 19:29:18.27203	2014-07-14 19:34:16.22987	6h represents how many dollars he makes per hour.\r\n6h + 75 represents how much money he will have in total.\r\na) ---|---------|---------|----*====|=========|====\r\n     20        30        40        50        60       \r\nb) ===|=========|=========|====*----|---------|----\r\n     20        30        40        50        60    \r\nSolutions to a indicate hours greater than or equal to the number of hours he needs to work to get the bike.   	\N	\N	\N	\N	\N	\N
146	4	17	Chase began a number puzzle with the words “Pick a number, add 7 to it, and double the result.”\r\nChase meant to say, “Pick a number, double it, and add 7 to the result.” Are these two instructions equivalent? Explain.		2014-07-14 19:41:54.787966	2014-07-14 19:41:54.787966	Not at all the same. The first is equivalent to 2(x + 7). The second is 2x + 7. These will only be the same if x is 0.	\N	\N	\N	\N	\N	\N
147	5	17	The distance from PEA to the beach at Little Boar’s Head is 10 miles. If you bike from PEA to the beach in 40 minutes, what is your average speed for the trip? What does this mean?		2014-07-14 19:46:26.444494	2014-07-14 19:46:26.444494	10/(40/60) = average speed is 15 miles per hour.\r\nAverage speed means speed as derived from the total time and distance, so faster and slower speeds along the way are 'averaged' into a single speed that takes all of them into account.	\N	\N	\N	\N	\N	\N
148	6	17	(Continuation) On the return trip from the beach, you pedal hard for the first ten minutes and cover 4 miles. Tired, you slow down and cover the last 6 miles in 36 minutes.\r\nWhat is your average speed for the return trip?		2014-07-14 19:49:42.547587	2014-07-14 19:49:42.547587	10/(46/60) = 13.04 miles per hour	\N	\N	\N	\N	\N	\N
149	7	17	Solve the inequality 3 − x > 5 using only the operations of addition and subtraction.\r\nIs x = 0 a solution to the inequality?		2014-07-14 19:53:30.26833	2014-07-14 19:53:30.26833	 3 - x > 5\r\n-3      -3\r\n   -x > 2\r\n    x < -2\r\n\r\n0 is not a solution, as the direction of the inequality needs to be reversed when multiplying by -1.	\N	\N	\N	\N	\N	\N
150	8	17	Alden paid to have some programs printed for the football game last weekend. The printing cost per program was 54 cents, and the plan was to sell them for 75 cents each. Poor weather kept many fans away from the game, however, so unlucky Alden was left with 100 unsold copies, and lost $12 on the venture. How many programs did Alden have printed?	Doesn't come out even, rounding to the nearest dollar.	2014-07-14 20:12:16.444813	2014-07-14 20:12:16.444813	let n be number of programs printed\r\n\r\n54n - ((n-100)*75) = -1200\r\n54n - (75n - 7500) = -1200\r\n    - 21n +7500  = -1200\r\n       21n = 8700\r\n        n = 8700/21\r\n414 programs were printed	\N	\N	\N	\N	\N	\N
151	9	17	The Mount Major hike starts in Alton Bay, 716 feet above sea level. The summit is 1796 feet above sea level, and it takes about 45 minutes for a typical hiker to make the climb. Find the rate at which this hiker gains altitude, in feet per minute.		2014-07-14 20:15:32.335697	2014-07-14 20:15:32.335697	1796-716 = 1,080 feet gained in altitude.\r\n1080/45 = 24 feet per minute	\N	\N	\N	\N	\N	\N
141	7	16	The rectangle shown at right has been broken into four smaller rectangles. The areas of three of the smaller rectangles are shown in the diagram.\r\nFind the area of the fourth one.		2014-07-14 14:52:46.741045	2014-07-24 16:44:30.159803	(312/234) * 270 = 360\r\nor\r\n(270/234) + 312 = 360	PBL_Graph_16_7.PNG	\N	\N	\N	\N	\N
142	8	16	Tickets to a school play cost $1.50 if bought in advance, and $2.00 if bought at the door. By selling all 200 of their tickets, the players brought in $360. \r\nHow many of the tickets were sold in advance?		2014-07-14 14:58:51.861838	2014-08-19 13:19:59.202946	a = bought in advance, d = bought at door\r\n1.5a + 2d = 360\r\na + d = 200\r\n   2a + 2d = 400\r\n-1.5a + 2d = 360\r\n      0.5a = 40\r\n         a = 80 tickets were bought in advance\r\n\r\ncheck = 80 * 1.5 = 120   120*2 = 240     240 + 120 = 360\r\n\r\n	\N	\N	\N	\N	\N	\N
156	4	18	The line through (1; 6) and (0; 3) passes through every quadrant except one. Which one?		2014-07-15 06:04:29.129859	2014-07-15 06:06:35.098926	Quadrant IV	\N	\N	\N	\N	\N	\N
157	5	18	Combine over a common denominator without using a calculator:\r\n(a) 1/4 + 1/5\r\n(b) 1/10 + 1/11\r\n(c) 1/x + 1/(x + 1)\r\n\r\nEvaluate your answer to (c) with x = 4 and then with x = 10. How do these answers compare to your answers to (a) and (b)?		2014-07-15 06:12:30.138737	2014-07-15 06:14:51.838593	(a) 1/4 + 1/5 = 5/29 + 4/20 = 9/20\r\n(b) 1/10 + 1/11 = 11/110 + 10/110 = 21/110\r\n(c) 1/x + 1/(x + 1) = (x + 1 + x)/(x^2 + x) = (2x + 1)/(x^2 + x)\r\n\r\nc with 4 = 9/20,  c with 10 = 21/110. The answers are the same:)	\N	\N	\N	\N	\N	\N
158	6	18	A small pool is 20 feet long, 12 feet wide and 4 feet deep. There are 7.5 gallons of water in every cubic foot. At the rate of 5 gallons per minute, how long will it take to fill this pool?		2014-07-15 06:17:44.650449	2014-07-15 06:17:44.650449	20*12*4 = 960 cubic feet in the pool\r\n960*7.5 = 7200 gallons\r\n7200/5 = 1,440 minutes or 24 hours	\N	\N	\N	\N	\N	\N
163	4	19	(Continuation) The slope of a line is a measure of how steep the line is. It is calculated by dividing the change in y-coordinates by the corresponding change in x-coordinates between two points on the line: slope = change in y/change in x. Calculate the slope of the line that goes through the two points (1, 3) and (7. 6). Calculate the slope of the line that goes through the two points (0, 0) and (9, 6). Which line is steeper?		2014-07-16 04:36:26.338313	2014-07-24 16:48:18.251887	First Line = (6/3)/(7-1) = 3/6 = 1/2\r\nSecond Line= 6/9 = 2/3\r\nThe second line is steeper.	\N	PBL_Graph_ans_19_4.PNG	\N	\N	\N	\N
162	3	19	Each step of the stairs leading from room 9 to room 107 in the Academy Building has a vertical rise of 7 inches and a horizontal run of 12 inches. Each step of the marble staircase leading to the Assembly Hall has a vertical rise of 5.5 inches and a horizontal run of 13 inches.\r\n(a) Which flight of stairs do you think is steeper? Why?\r\n(b) Calculate the ratio rise=run for each flight of stairs, and verify that the greater ratio\r\nbelongs to the flight you thought to be steeper.		2014-07-16 04:27:30.263854	2014-08-19 14:31:49.696366	Academy Building 9 to 108 slope is 7/12\r\nAcademy Building marble staircase 5.5/13\r\nMarble staircase is less steep as it rises less in a greater horizontal run.\r\nRatio 1 = .5833\r\nRatio 2 = .4230\r\n	\N	\N	\N	\N	\N	\N
164	5	19	Explain why the descriptions “right 5 up 2”, “right 10 up 4”, “left 5 down 2”, “right 5/2 up 1”, and “left 1 down 2/5” all describe the same inclination for a straight line.		2014-07-16 04:37:41.410752	2014-07-16 04:37:41.410752	Because they all describe the same slope, 5/2.	\N	\N	\N	\N	\N	\N
166	7	19	Solve the following for x: (a) x/2 + x/5 = 6 (b) x/3 + (x + 1)/6 = 4		2014-07-16 05:30:00.867096	2014-07-16 05:30:00.867096	(a) x/2 + x/5 = 6  ->   5x/10 + 2x/10 = 6   ->  7x/10 = 6   ->  7x = 60  ->  x = 60/7\r\n\r\n(b) x/3 + (x + 1)/6 = 4   ->  2x/6 (x+1)/6 = 4   ->  2x + x + 1 = 24  -> 3x +1 = 24  ->  x = 23/3\r\n\r\nCheck a:  (60/7)/2 + (60/7)/5 = 6  ->  (300/7)/10 + (120/7)/10 = 6   ->  420/7 = 60,  60 = 60\r\nCheck b:  (23/3)/3 + (23/3 + 1)/6 = 4  ->   (46/3)/6 + (23/3 + 3/3)/6 = 4  ->   (72/3)/6 = 4  ->  24/6 = 4  ->  4 = 4	\N	\N	\N	\N	\N	\N
167	8	19	A sign placed at the top of a hill on Route 89 says “8% grade. Trucks use lower gear.” What do you think that “8% grade” might mean?		2014-07-16 05:31:37.185842	2014-07-16 05:31:37.185842	8% grade would mean that the rise is 8% of the run, i.e. the road would rise 8 feet for each 100 feet of run.	\N	\N	\N	\N	\N	\N
155	3	18	Exeter building code does not permit building a house that is more than 35 feet tall. An architect working on the design shown at right would like the roof to be sloped so that it rises 10 inches for each foot of horizontal run.\r\n(a) Given the other dimensions in the diagram, will the builder be allowed to carry out this plan?\r\n(b) Two vertical supports (shown dotted in the diagram) are to be placed 6 feet from the center of the building. How long should they be?		2014-07-15 06:00:50.636076	2014-07-24 16:46:08.575095	a) 15 feet of horizontal run, so 15*10 or 150 inches of rise. 150 inches = 12.5 feet + 22 feet below makes 34.5 feet tall, so the house plan is ok\r\nb) 30 - 12 = 18 feet, so each support is 9 feet in from the walls. So each support should be 90 inches long.	PBL_Graph_18_3.PNG	\N	\N	\N	\N	\N
160	1	19	The rectangle ABCD shown at right has sides that are parallel to the coordinate axes. It is three times as wide as it is tall, and its perimeter is 56 units.\r\n(a) Find the length and width of ABCD.\r\n(b) Given the information D = (9; 2), find\r\nthe coordinates for points A, B, and C.		2014-07-16 04:07:46.667708	2014-07-24 16:47:21.429422	4w = 56\r\nw = 14\r\nl = 42\r\n\r\nA= -12,2,  B= =12, -7  C= 9, -7  D= 9,2\r\n	PBL_Graph_19_1.PNG	PBL_Graph_ans_19_1.PNG	\N	\N	\N	\N
153	2	18	Pat bought several pens at Walgreen’s, for 60 cents each. Spending the same amount of money at the Bookstore, Pat then bought a few more pens that cost 80 cents each. In all, 42 pens were bought. How many pens did Pat buy at the bookstore?	Guess and check	2014-07-15 05:49:19.622293	2014-08-19 13:46:35.87642	 w + b = 42\r\n.6w = .8b\r\n w = (4/3)b\r\n(4/3)b + b = 42\r\n(7/3)b = 42\r\n7b = 126\r\nb = 18, w = 24, 18 pens bought at bookstore\r\n\r\ncheck; 18*.8 = 24*.6 -> 14.4 = 14.4\r\n\r\n	\N	\N	\N	\N	\N	\N
161	2	19	A ladder is leaning against the side of a building. Each time I step from one rung to the next, my foot moves 6 inches closer to the building and 8 inches further from the ground. The base of the ladder is 9 ft from the wall. How far up the wall does the ladder reach?		2014-07-16 04:22:27.427678	2014-09-05 14:03:01.013283	9 ft. = 18 steps\r\n18*9 = 162 inches or 13.5 feet\r\n12 feet	\N	PBL_Graph_ans_19_2.PNG	\N	\N	\N	\N
169	2	20	The perimeter of a rectangle is 100 and its length is x. What expression represents the width of the rectangle?		2014-07-16 05:39:57.903914	2014-07-16 05:39:57.903914	(100-2x)/2	\N	\N	\N	\N	\N	\N
170	3	20	When a third of a number is subtracted from a half of the same number, 60 is the result. Find the number.		2014-07-16 05:42:45.144236	2014-07-16 05:42:45.144236	x/2 - x/3 = 60\r\n3x/6 - 2x/6 = 60\r\n3x - 2x = 360\r\nx = 360\r\n\r\ncheck: 180-120 = 60	\N	\N	\N	\N	\N	\N
171	4	20	Suppose that n represents an integer. What expression represents the next larger integer? the previous integer? the sum of these three consecutive integers?		2014-07-16 05:44:17.255467	2014-07-16 05:44:17.255467	Next larger: n+1\r\nPrevious: n-1\r\nSum of all three:  n -1 + n + n + 1 = 3n	\N	\N	\N	\N	\N	\N
177	1	21	Each beat of your heart pumps approximately 0.006 liter of blood.\r\n(a) If your heart beats 50 times, how much blood is pumped?\r\n(b) How many beats does it take for your heart to pump 0.45 liters?		2014-07-16 20:40:40.114473	2014-07-16 20:40:40.114473	a) 50 * .006 = .3 liters\r\nb) .006/.45 = 75 beats\r\n	\N	\N	\N	\N	\N	\N
172	5	20	Eugene and Wes are solving the inequality 132−4x ≤ 36. Each begins by subtracting 132 from both sides to get −4x ≤ −96, and then each divides both sides by −4. Eugene gets x ≤ 24 and Wes gets x ≥ 24, however. Always happy to offer advice, Alex now suggests to Eugene and Wes that answers to inequalities can often be checked by substituting x = 0 into both the original inequality and the answer. What do you think of this advice? Graph each of these answers on a number line. How do the results of this question relate to the flooding of the Exeter River?		2014-07-16 05:46:09.48577	2014-07-16 20:17:01.065896	Substituting 0 helps because it doesn't work, making clear that the answer has to be greater than 24.\r\na) ===|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========|=========*---------|---------|----\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28 \r\n\r\na) ---|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------*=========|=========|====\r\n     -2         0         2         4         6         8        10        12        14        16        18        20        22        24        26        28  \r\nWhen the Exeter river is flooding, it reaches a high point above flood stage, all the values will be less than that high point.	\N	\N	\N	\N	\N	\N
173	6	20	(Continuation) After hearing Alex’s suggestion about using a test value to check an inequality, Cameron suggests that the problem could have been done by solving the equation 132 − 4x = 36 first. Complete the reasoning behind this strategy		2014-07-16 20:06:17.905293	2014-07-16 20:23:10.000556	This will give the base point from which the inequality will continue either left or right. You then know it goes right because 132 - (4*x) has to be less than 32, which requires a larger x.	\N	\N	\N	\N	\N	\N
174	7	20	(Continuation) Deniz, who has been keeping quiet during the discussion, remarks,“The only really tricky thing about inequalities is when you try to multiply them or divide them by negative numbers, but this kind of step can be avoided altogether. Cameron just told us one way to avoid it, and there is another way, too.” Explain this remark by Deniz.		2014-07-16 20:20:31.684823	2014-07-16 20:25:37.164622	Add 4x to both sides, then it isn't necessary to divide by a negative number:\r\n132−4x ≤ 36\r\n132 ≤ 4x + 36\r\n96 ≤ 4x\r\n24 ≤ x\r\n	\N	\N	\N	\N	\N	\N
180	4	21	Find the slope of the line containing the points (4; 7) and (6; 11). Find coordinates for another point that lies on the same line and be prepared to discuss the method you used to find them.		2014-07-16 21:03:07.600033	2014-07-16 21:03:07.600033	Slope is (11-7)/(6-4) or 4/2 or 2.\r\n\r\n(5,9) is on the line as we can get 5 by going over 1 from 4, and then 9 by going up 2 from 7.\r\n	\N	\N	\N	\N	\N	\N
181	5	21	Find an easy way to do the following calculations mentally: (a) 25 · 39 · 4 (b) 632/50		2014-07-16 21:06:35.242096	2014-07-16 21:06:35.242096	4 * 25 is 100, times 39 is 3900\r\nIf you divided 632 by 100 you'd get 6.32, so dividing it by 50 would be twice that or 12.64	\N	\N	\N	\N	\N	\N
182	6	21	To earn Hall of Fame distinction at PEA, a girl on the cross-country team must run the 5-km course in less than 20 minutes. What is the average speed of a 20-minute runner, in km per hour? in meters per second? Express your answers to two decimal places.		2014-07-17 16:00:49.551684	2014-07-17 16:00:49.551684	5/20 = .25 km per minute, .25 * 60 = 15.00 km per hour.\r\n.25/60 = .004167 km per second or 4.17 meters per second.\r\n\r\ncheck: 4.17 * 60 * 20 = ~5,000 meters or 5k	\N	\N	\N	\N	\N	\N
183	7	21	The proportion 5/20 = x/60 is helpful for the previous question. Explain this proportion, and assign units to all four of its members.		2014-07-17 16:06:23.356647	2014-07-17 16:06:23.356647	5 km divided by 20 minutes gives speed in km per minute. Since km per hour was asked for, we need to multiply by 60. The 60 under x accomplishes that, so that x when solved will be the speed in km per hour.	\N	\N	\N	\N	\N	\N
175	8	20	Draw the segment from (3; 1) to (5; 6), and the segment from (0; 5) to (2; 0). Calculate their slopes. You should notice that the segments are equally steep, and yet they differ in a significant way. Do your slope calculations reflect this difference?		2014-07-16 20:31:44.607217	2014-07-24 16:50:03.788034	First line slope = 5/2  Second line slope = -5/2\r\n\r\nThey are going in different directions since the slope of the second line is negative.	\N	PBL_Graph_20_8.PNG	\N	\N	\N	\N
178	2	21	(Continuation) Direct-variation equations can be written in the form y = kx, and it is customary to say that y depends on x. Find an equation that shows how the volume V pumped depends on the number of beats n. Graph this equation, using an appropriate scale, and calculate its slope. What does the slope represent in this context?		2014-07-16 20:54:49.800041	2014-07-24 16:50:39.939331	V - .006n\r\n\r\nslope = .3/50 = .006\r\nThe slope is constant k in y = kx.\r\n	\N	PBL_Graph_ans_21_2.PNG	\N	\N	\N	\N
179	3	21	Estimate the slopes of all the segments in the diagram. Identify those whose slopes are negative. Find words to characterize lines that have negative slopes.		2014-07-16 20:57:55.899095	2014-07-24 16:51:03.235456	a) -1/6\r\nb) -5/3\r\nc) 5/3\r\nd) 3/6 or 1/2\r\n\r\nThe ones with negative slope go down from left to right.	PBL_Graph_21_3.PNG	\N	\N	\N	\N	\N
773	9	84	Factor:\r\n(a) x² − 81 (b) 4x² − 81 (c) 81 − x² (d) 0:04x² − 81		2014-08-30 04:46:29.778504	2014-08-30 04:46:29.778504	(a) x² − 81       ->  (x-9)(x+9)\r\n(b) 4x² − 81      ->  (2x-9)(2x+9)\r\n(c) 81 − x²       ->  (9-x)(9_x)\r\n(d) 0.04x² − 81   ->  (.2x-9)(.2x+9)	\N	\N	\N	\N	\N	\N
772	8	84	Graph the equation y = −2x² + 5x + 33. For what values of x \r\n(a) is y = 0? \r\n(b) is y = 21? \r\n(c) is y ≥ 0?		2014-08-30 04:43:04.115743	2014-08-30 05:07:43.54709	a) 33\r\nb) 4 and -3/2\r\nc) -3 and 5.5	\N	PBL_ans_84_8.PNG	\N	\N	\N	\N
822	6	89	The hypotenuse of a right triangle is twice as long as the shortest side, whose length is m. In terms of m, what is the length of the intermediate side?		2014-08-31 17:17:04.081874	2014-08-31 17:17:04.081874	√(2m²-m²)	\N	\N	\N	\N	\N	\N
513	7	52	Calculate the area of the region defined by the simultaneous inequalities y ≥ x − 4, y ≤ 10, and 5 ≤ x + y.		2014-08-11 00:55:19.948048	2015-01-13 15:21:46.684489	9.5*19/2 = 90.25	\N	pbl_ans_52-7.PNG	90.25	Lucia	Ben	1
202	4	23	Find coordinates for the points where the line 3x + 2y = 12 intersects the x-axis and the y-axis. These points are called the 'x-intercept' and 'y-intercept', respectively. Use these points to make a quick sketch of the line.	\r\n	2014-07-19 19:04:46.104806	2014-10-27 15:16:07.130396	x-int: (4,0), y-int: (0,6) |\r\n3x + 2y = 12\r\n2y = -3x + 12\r\ny = -3/2x + 6\r\n2y = 12  ->  y intercept = (0,6)\r\n3x = 12  ->  x intercept = (4,0)	\N	PBL_ans_23_4.PNG		Alex, Suzana	Ben	1
190	3	22	Suppose that n represents a positive even integer. What expression represents the next even integer? the next odd integer? I am thinking of three consecutive even integers, whose sum is 204. What are they?		2014-07-17 16:53:04.701904	2014-10-10 15:25:01.127587	n+2, n+1, 66,68,70 |\r\nNext even integer is n + 2, next odd is n + 1.\r\n204/3 = 68\r\n66, 68 , 70\r\n	\N	\N	n+2, n+1, 66,68,70	Alex	Caroline	1
195	8	22	Can you think of a number k for which k^2 < k is true? Graph all such numbers on a number line. Also describe them using words, and using algebraic notation.		2014-07-19 14:31:48.785301	2014-10-10 15:22:39.826908	positive fractions |\r\na) ---|---------o---------0=========0---------|-----\r\n     -2        -1         0         1         2     \r\n\r\nNumbers between 0 and 1\r\n0 < k < 1  	\N	\N	0 < k < 1  	Scott	Caroline	1
199	1	23	If you graph the line y = 0.5x+3 on your calculator, it is likely that both axis intercepts are visible. If you try to graph y = 0.1x + 18 on your calculator, it is quite likely that the axis intercepts are not both visible. What are the axis intercepts? Describe how to set the calculator’s “window” so that they both become visible.		2014-07-19 15:03:02.41032	2014-07-24 16:57:20.433463	Graph attached. \r\nFirst graph intercepts x at 3 and y at -6.\r\nSecond graph intercepts x at 18 and y at -180.\r\n\r\nRescale the window.	\N	PBL_ans_23_1.PNG	\N	\N	\N	\N
204	6	23	Compare the graph of y = 2x + 5 with the graph of y = 3x + 5. \r\n(a) Describe a context from which the equations might emerge.\r\n(b) Linear equations that look like y = mx + b are said to be in 'slope-intercept form'.\r\nExplain. The terminology refers to which of the two intercepts?		2014-07-19 19:19:31.23509	2014-10-27 15:17:11.914092	a) There is a flat charge of $5 for any group using a campground, plus an additional $2 or $3 for each person in the group depending on whether its a weekday or a weekend.\r\nb) a is the slope of the line, b is the y intercept.	\N	PBL_ans_23_6.PNG		Jason, Jaden		\N
203	5	23	Drivers in distress near Exeter have two towing services to choose from: Brook’s Body Shop charges $3 per mile for the towing, and a fixed $25 charge regardless of the length of the tow. Morgan Motors charges a flat $5 per mile. On the same system of axes, represent each of these choices by a linear graph that plots the cost of the tow versus the length of the tow. If you needed to be towed, which service would you call, and why?	\r\n	2014-07-19 19:13:29.342858	2014-10-27 15:16:53.746324	d < 12.5 miles, use Morgan, else Books |\r\nAt 12.5 miles the two services cost the same, $62.50  ( 12.5 * 5 and (12.5 * 3) + 25 ). Any mileage below that Morgan is cheaper, above that Brooks it the cheaper choice.	\N	PBL_ans_23_5.PNG		Matt K.	Mattt, Shantanu, Jarod	1
197	10	22	Solve x/4 + (x + 1)/3 ≤ 12\r\nand shade the solution interval on a number line.		2014-07-19 14:49:35.917317	2014-10-10 15:23:55.868686	z = 2/7 |\r\nx/4 + (x + 1)/3 ≤ 1/2\r\n3x/12 + 4(x+1)/12 ≤ 1/2\r\n(3x + 4x + 4)/12 ≤ 1/2\r\n(7x + 4)/12 ≤ 1/2\r\n7x + 4 ≤ 6\r\n7x ≤ 2\r\nx ≤ 2/7\r\n\r\na) ===|=========|=========|=========|=========*---------|-----\r\n    -20       -10         0        10        20        30   \r\n\r\ncheck:  20/4 + 21/3 = 12  ->  5 + 7 = 12\r\n	\N	\N	x ≤ 2/7	Suzana	Liam	1
200	2	23	How much time does it take for a jet to go 119 miles, if its speed is 420 mph? Be sure to specify the units for your answer.	\r\n	2014-07-19 15:07:02.011331	2014-10-27 15:15:13.058906	119/420 = .2833 hours | or about 17 minutes (.2833/60)	\N	\N		Maya	Liam	1
191	4	22	A car and a small truck started out from Exeter at 8:00 am. Their distances from Exeter, recorded at hourly intervals, are recorded in the tables at right. Plot this information on the same set of axes and draw two lines connecting the points in each set of data. What is the slope of each line? What is the meaning of these slopes in the context of this problem?		2014-07-17 17:04:13.918066	2014-10-10 15:19:23.793356	car = 52, truck = 46, slope is rate in mph |\r\nSlope of car is 52, slope of truck is 46\r\nThe slope is the speed of the vehicles in miles per hour.The car has a steeper slope as it goes faster.	PBL_Graph_22_4.PNG	PBL_Graph_ans_22_4.PNG	c=52, t =46, slope is rate in mph	Maya	Ben	1
192	5	22	(Continuation) Let t be the number of hours each vehicle has been traveling since 8:00 am (thus t = 0 means 8:00 am), and let d be the number of miles traveled after t hours.\r\nFor each vehicle, write an equation relating d and t.		2014-07-17 17:07:05.981862	2014-10-10 15:20:26.96537	Car - d = t * 52\r\nTruck - d = t * 46	\N	\N	c: d=52t, t: d=46t	Matt V	Sam	1
198	11	22	Find three consecutive odd numbers whose sum is 117. Find two ways to do this.		2014-07-19 14:55:14.802405	2014-10-10 15:24:35.235551	37, 39, 41 |\r\nn + 1 + n + 3 + n + 5 = 117\r\n3n + 9 = 117\r\n3n = 108\r\nn = 36\r\n37, 39, 41\r\n\r\nor\r\nn + n + 2 + n + 4 = 117\r\n3n + 6 = 117\r\n3n = 111\r\nn = 37\r\n	\N	\N	37, 39, 41	Maya, Avery	Nicole	1
196	9	22	One year after Robin deposits 400 dollars in a savings account that pays r% annual interest, how much money is in the account? Write an expression using the variable r.		2014-07-19 14:41:28.330683	2014-10-10 15:23:21.119497	400 + (400*r)/100 or\r\n400 + 400*(r/100)\r\n400 + 4r or \r\n400(1 + r/100)\r\n	\N	\N	400 + 4r	Lucia, Miranda, Maya	Ben	1
194	7	22	If k stands for an integer, then is it possible for k2 + k to stand for an odd integer?\r\nExplain.		2014-07-19 14:31:03.170072	2014-10-10 15:21:57.712263	no, it must be even |\r\nIf k is even, k^2 + k will be even because it will be the sum of two even numbers. The square must be even because two even numbers multiplied will be even, since they will have 2 as a factor.\r\nIf k is odd, k^2 + k will still be even because it will be the sum of two odd numbers, which must be even. If n is even, n + 1 is odd, and n + 1 + n + 1 or 2n + 2 must be even. An odd number squared must be odd because (n+1)(n+1) = n^2 + 2n + 1. The first two terms are even so adding 1 makes the total odd.	\N	\N	no	Lucia, Garrett	Nicole	1
201	3	23	Word chains. As the ancient alchemists hoped, it is possible to turn lead into gold. You change one letter at a time, always spelling real words: lead—load—toad—told—gold. Using the same technique, show how to turn work into play.	\r\n	2014-07-19 18:56:01.073976	2014-10-27 15:15:41.028661	work-pork-perk-pert-peat-plat-play\r\nwork-pork-perk-peak-peat-prat-pray-play	\N	\N		Matt V.	Henry	1
205	7	23	Driving from Boston to New York one day, Sasha covered the 250 miles in five hours Because of heavy traffic, the 250-mile return took six hours and fifteen minutes. Calculate average speeds for the trip to New York, the trip from New York, and the round trip. Explain why the terminology average speed is a bit misleading.		2014-07-19 19:23:43.139532	2014-10-27 15:17:36.145255	50, 40, 44.4 mph |\r\nBoston -> NY 250/5 - 50 mph\r\nNY -> Boston 250/6.25 - 40 mph\r\nRound Trip - 500/11.25 - 44.44 mph\r\nAverage speed can be misleading since it wipes out potentially significant differences between the components that make up the average.	\N	\N		Avery	Caroline	1
220	10	24	The volume of a circular cylinder is given by the formula V = πr²h.\r\n(a) To the nearest tenth of a cubic cm, find the volume of a cylinder that has a 15-cm radius and is 12-cm high.\r\n(b) Solve the volume formula for h. Then, if the volume is 1000 cc and the radius is 10 cm, find h to the nearest tenth of a cm.		2014-07-21 15:04:49.084852	2014-10-27 15:25:11.598881	8,482.3 cm³, h=V/(πr²), 3.2 cm |\r\na) pi*15*15*12 = 8,482.3 cm³\r\nb) h = V/(πr²)\r\n1000/(pi*100) = 3.2 cm	\N	\N	8,482.3 cm³, h=V/(πr²), 3.2 cm	Avery	Sam	1
217	7	24	At 1 pm, you start out on your bike at 12 mph to meet a friend who lives 8 miles away. At the same time, the friend starts walking toward you at 4 mph. How much time will elapse before you meet your friend? How far will your friend have to walk?		2014-07-21 14:42:42.792549	2014-10-27 15:23:47.844425	30 min; 2 miles |\r\n12t + 4t = 8\r\n16t = 8\r\nt = 1/2\r\nt = 30 minutes\r\nFriend has to walk 2 miles.\r\n\r\ncheck: walker goes 2 miles in 1/2 hour, cyclist goes 6 miles in 1/2 hour.\r\n   	\N	\N	30 min; 2 miles	Miranda	Matt L., Liam	1
213	3	24	Combine over a common denominator: 1/a + 2/3a + 3		2014-07-21 04:49:00.190199	2014-10-27 15:21:24.155695	(9a + 5)/3a\r\n1/a + 2/3a + 3\r\n3/3a + 2/3a + 9a/3a\r\n(9a + 5)/3a	\N	\N	(9a + 5)/3a	Jaden, Scott	Julia	2
206	8	23	Find the value of x that makes 0.1x + 0.25(102 − x) = 17.10 true.		2014-07-19 19:32:43.660287	2014-10-27 15:18:02.599698	x = 56 |\r\n0.1x + 0.25(102 − x) = 17.10\r\n0.1x + 25.5 − 0.25x = 17.10\r\n-0.15x + 25.5 = 17.10\r\n.15x = 8.4\r\n   x = 56\r\n\r\nCheck: 0.1(56) + 25.5 − 0.25(56) = 17.10\r\n           5.6 + 25.5 - 14 = 17.10\r\n	\N	\N		Miranda	Hannah	1
209	11	23	Without using parentheses, write an expression equivalent to 3(4(3x−6)−2(2x+1)).		2014-07-19 20:07:54.397871	2014-10-27 15:19:11.102531	 |\r\n3(4(3x−6)−2(2x+1))\r\n3(12x-24-4x-2)\r\n3(8x-26)\r\n24x-78	\N	\N	24x-78	Jason	Simon	1
208	10	23	Find all the values of x that make 0.1x + 0.25(102 − x) < 17.10 true.		2014-07-19 19:59:00.551065	2014-10-27 15:18:41.81961	x > 56 |  \r\n0.1x + 0.25(102 − x) < 17.10\r\n0.1x + 25.5 − 0.25x < 17.10\r\n-0.15x + 25.5 < 17.10\r\n.15x > 8.4\r\n   x > 56\r\n	\N	\N		Garrett		1
218	8	24	The population of a small town increased by 25% two years ago and then decreased by by 25% last year. The population is now 4500 persons. What was the population before the two changes?		2014-07-21 14:47:54.177375	2014-10-27 15:24:17.610257	4800 two years ago | \r\n4500/.75 = 6000 last year\r\n 6000/1.25 = 4800 two years ago\r\n\r\ncheck: 4800 * 1.25 = 6000 * .75 = 4500\r\n	\N	\N	4800 two years ago	Lucia	Liam	1
222	1	25	Which of the following pairs of quantities vary directly?\r\n(a) the circumference of a circle and the diameter of the circle;\r\n(b) the distance traveled in two hours and the (average) rate of travel;\r\n(c) the number of gallons of gasoline bought and the cost of the purchase;\r\n(d) the area of a circle and the radius of the circle.	\r\n	2014-07-21 15:12:46.515593	2014-10-27 16:30:14.781834	all but d |\r\na) varies directly, as the circumference is always pi times the diameter\r\nb) varies directly, as doubling the average rate will double the distance traveled\r\nc) varies directly, as the cost will be the gallons bought times the price per gallon\r\nd) doesn't vary directly, as the area will increase by the square of the radius	\N	\N	all but d	Jason, Lucia	Jared, Henry	1
212	2	24	Farmer MacGregor needs to put a fence around a rectangular carrot patch that is one and a half times as long as it is wide. The project uses 110 feet of fencing. How wide is the garden?		2014-07-21 01:37:57.239395	2014-10-27 15:20:46.261761	22 feet wide |\r\n2w + 3w = 110\r\n5w = 110\r\nwidth is 22, length is 33\r\n\r\ncheck: 22+22+33+33 = 110	\N	\N	22 feet wide	Scott	Nicole, Simon	1
221	11	24	It takes ten Preps ten days to paint ten houses. How many houses can five Preps paint in five days?		2014-07-21 15:09:07.045866	2014-10-27 15:25:40.958914	2.5 houses |\r\nrate * time = distance(houses)\r\n10p * 10 days = 10 houses\r\np = 10/100\r\np = .1, one prep paints .1 house in 1 day.\r\n5*5*.1 = 2.5 houses	\N	\N	2.5 houses	Matt K.	Shantanu	1
219	9	24	Given that it costs $2.75 less to buy a dozen doughnuts than to buy twelve single doughnuts, and that 65 doughnuts cost $25.25, and that 65 = 5 · 12 + 5, what is the price of a single doughnut?		2014-07-21 14:57:58.279677	2014-10-27 15:26:32.640566	$0.60 per donut |\r\n65d - (5*2.75) = 25.25\r\n65d = 25.25 + 13.75\r\n65d = 39\r\nd = .6\r\n60 cents per donut\r\n\r\ncheck: 65d * .6 = 39 - (5*2.75) = 25.25	\N	\N	$0.60 per donut	Lucia	Caroline	1
238	9	26	After you graph the line y = 4x + 6, find\r\n(a) the y-coordinate of the point on the line whose x-coordinate is 2;\r\n(b) the x-coordinate of the point on the line whose y-coordinate is 2.\r\n	\r\n	2014-07-23 18:54:13.463923	2014-10-27 16:42:28.190398	a) 14, b) -1 |\r\na) 4*2 + 6, 14\r\nb) 2 = 4x + 6, 4x = -4, x = -1\r\n	\N	PBL_ans_26_9.PNG	a) 14, b) -1	Matt L.	Sam	1
215	5	24	If 6% of x is the same as 5% of 120, then what is x?		2014-07-21 05:01:32.780946	2014-10-27 15:22:29.733005	x = 100 |\r\n.06x = .05*120\r\n.06x = 6\r\nx = 6/.06\r\nx = 100\r\n\r\ncheck: 6% of 100 is 6, 5% of 120 is 6.	\N	\N	x = 100	Suzana	Henry	1
216	6	24	Find the solution sets and graph them on a number line.\r\n(a) 46 − 3(x + 10) = 5x + 20\r\n(b) 46 − 3(x + 10) < 5x + 20\r\n(c) 46 − 3(x + 10) > 5x + 20		2014-07-21 05:14:19.550857	2014-10-27 15:23:08.413006	x = -1/2, > -1/2, < -1/2 |\r\na) 46 − 3(x + 10) = 5x + 20  ->  46 - 3x -30 = 5x + 20  ->  16 - 3x = 5x + 20  ->  -4 = 8x  ->  x = -1/2\r\ncheck:  46 - (3(-1/2 + 10) = 5(-1/2) + 20  ->  46 - (-3/2) - 30  = -5/2 + 20   ->   16 + 3/2 = 20 - 5/2 -> 35/2 = 35/2\r\nb) x > -1/2\r\nC) x < -1/2   \r\na) ---|---------|----*----|---------|---------|-----\r\n     -2        -1         0         1         2     \r\na) ---|---------|----o====|=========|=========|-----\r\n     -2        -1         0         1         2     \r\na) ===|=========|====o----|---------|---------|-----\r\n     -2        -1         0         1         2     	\N	\N	x = -1/2, > -1/2, < -1/2 	Matt V	Hannah	1
210	12	23	One year after Robin deposits P dollars in a savings account that pays r% annual interest, how much money is in the account? Write an expression in terms of the variables P and r. If you can, write your answer using just a single P.		2014-07-19 20:09:08.33843	2014-10-27 15:19:30.593213	P*(1+r/100)	\N	\N	P*(1+r/100)	Scott		1
223	2	25	A jet, cruising at 26400 feet, begins its descent into Logan Airport, which is 96 miles away. Another jet, cruising at 31680 feet, is 120 miles from Logan when it begins its descent. Which of these two paths of descent is steeper? Explain.		2014-07-21 15:17:31.299776	2014-10-27 16:30:53.463151	J1- 275 fpm, J2- 264 fpm |\r\nJet 1 has to descend 26400/96 or 275 feet per mile\r\nJet 2has to descend 31680/120 or 264 feet per mile\r\n\r\nJet 1 has the steeper descent	\N	\N	J1- 275 fpm, J2- 264 fpm	Matt V.	Liam	1
224	3	25	The diagram shows two steel rods hinged at one end. The other end is connected by a bungee cord (the dotted segment), whose unstretched length is 10 inches. The rods are 5 inches and 18 inches long. Use inequality symbols to describe all the possible lengths for the bungee cord, which stays attached at both ends while it is being stretched.		2014-07-21 15:20:42.291852	2014-10-27 17:06:30.628715	13 <= length <= 23 | \r\nin inches, assuming the cord can be stretched that far.	\N	\N	13 <= length <= 23	Avery	Ben	1
234	5	26	A friend suggested that I change my cellphone company. This new company has a fixed monthly charge of $39.99, but it charges only 12 cents for each text message. Is this a better deal than the one described in the previous problem? Give evidence.		2014-07-23 18:27:25.614571	2014-10-27 17:12:41.303619	More than 125 messages make this a better deal |\r\nIf Avery averages around 100 text messages the monthly cost would be 39.99 + (100*.12) = 51.99. If Avery increased the number of texts it would begin to be a better value, but at the current number it isn't. \r\n39.99 + .12m = 29.99 + .2m\r\n3999 + 12m = 2999 + 20m\r\n8m = 1000\r\nm = 125	\N	\N	More than 125 messages make this a better deal	Suzana	Benji	1
230	1	26	A square game board is divided into smaller squares, which are colored red and black as on a checkerboard. All four corner squares are black. Let r and b stand for the numbers of red and black squares, respectively. What is the value of the expression b − r?	\r\n	2014-07-21 16:11:13.530488	2014-10-27 16:35:11.136248	one |\r\nBWB BWBWB\r\nWBW WBWBW\r\nBWB BWBWB\r\n    WBWBW\r\n    BWBWB\r\n\r\nThere will always be 1 more black square than white square. The number of squares must be odd to get a black on each corner. Thus there must be one more square in one set than the other, since they are otherwise alternating, like odd and even numbers.	\N	\N	one	Maya	Henry, Matt	1
232	3	26	What is the slope between (3, 7) and (5, 4)? (5, 4) and (3, 7)? \r\n(a, b) and (c, d)? \r\n(c, d) and (a, b)?	\r\n	2014-07-23 18:10:33.80368	2014-10-27 16:36:18.748872	a,b) -3/2, c,d) (b-d)/(a-c) |\r\na) (7/4)/(3-5) = -3/2\r\nb) (b-d)/(a-c)\r\nc) (d-b)/(c-a)\r\n	\N	\N	a,b) -3/2, c,d) (b-d)/(a-c)	Jaden	Nicole, Jared	1
231	2	26	At noon, my odometer read 6852 miles. At 3:30 pm, it read 7034 miles.\r\n(a) What was my average rate of change during these three and a half hours?\r\n(b) Let t represent the number of hours I have been driving since noon and y represent\r\nmy odometer reading. Write an equation that relates y and t. Assume constant speed.\r\n(c) Graph your equation.\r\n(d) Show that the point (5,7112) is on your line, and then interpret this point in the\r\ncontext of this problem.	\r\n	2014-07-23 18:06:28.967535	2014-10-27 16:35:46.738175	a) 52 mph, b) y = 52t + 6852 d) after 5 hrs odometer = 7112 |\r\na) 7034-6852 = 182/3.5 = 52 mph\r\nb) y = 52t + 6852\r\nc) attached\r\nd) (7112-6852)/5 + 6852 = 7112, after 5 hours at 52 mph the distance would be 260 miles, which is 7112 on the odometer.	\N	PBL_ans_26_2.PNG	a) 52 mph, b) y = 52t + 6852 d) after 5 hrs odometer = 7112	Avery	Hannah	1
235	6	26	For what values of x will the square and the rectangle shown at right have the same perimeter?	\r\n	2014-07-23 18:31:15.380073	2014-10-27 16:40:40.428976	x > -3 |\r\n4(x+5) = 2(x + 3) + 2(x + 7)\r\n4x + 20 = 4x + 6 + 16\r\nx = x\r\nAll positive numbers, 0, and x > -3.	PBL_26_6.PNG	\N	x > -3	Jason	Julia	1
226	5	25	Multiply 2 + x by 2x. Draw an algebra-block diagram to illustrate this calculation.	\r\n	2014-07-21 15:32:11.721768	2014-10-27 16:32:36.494458	4x + 2x² |\r\n2x(2+x) = 4x + 2x²\r\n   XXXXXXXXXXXXXXXX\r\n   X      |   |   X\r\n2x X      |   |   X\r\n   X      |   |   X\r\n   XXXXXXXXXXXXXXXX\r\n      x     1   1 	\N	\N	4x + 2x²	Jason, Maya	Julia	1
233	4	26	On top of a fixed monthly charge, Avery’s cellphone company adds a fee for each text message sent. Avery’s June bill was $50.79, which covered 104 text messages. The bill for May, which covered 83 text messages, was only $46.59.\r\n(a) What is the price of a text message?\r\n(b) What is the fixed monthly charge?\r\n(c) What would Avery be charged for a month that included 200 text messages?\r\n(d) What would Avery be charged for a month that included n text messages?	\r\n	2014-07-23 18:23:09.341671	2014-10-27 16:36:56.323993	a) $0.20, b) $29.99, c) $69.99, d) .2m+29.99 |\r\na) 50.79 - 46.59 = *104-83)t\r\n    4.20 = 21t\r\n       6 = 20 cents each\r\nb) 50.79 - (104*.2) = 29.99 or 46.59 - (83 * . 2) = 29.99\r\nc) 29.99 + (200*.2) = 69.99\r\nd) 29.99 + (.2m)\r\n	\N	\N	a) $0.20, b) $29.99, c) $69.99, d) .2m+29.99	Lucia	Liam	1
229	8	25	Solve the following inequalities and shade their solution intervals on a number line.\r\n(a) 2x/3 + (3x + 5)/2 ≤ 5 \r\n(b) 1/2(x − 1) + 3 > 1/3(2x + 1) − 1	\r\n	2014-07-21 16:00:06.438912	2014-10-27 16:34:16.24244	a) x ≤ 15/13  b) x < 19 |\r\n(a) 2x/3 + (3x + 5)/2 ≤ 5 \r\n4x/6 + (9x + 15)/6 ≤ 5\r\n4x + 9x + 15 ≤ 30\r\n13x ≤ 15\r\nx ≤ 15/13\r\n ===|=========|=========|=========|*--------|-----\r\n   -2        -1         0         1         2     \r\n(b) 1/2(x − 1) + 3 > 1/3(2x + 1) − 1\r\n6/2(x - 1) + 18 > 6/3(2x + 1) - 6\r\n3x - 3 + 18 > 4x + 2 - 6\r\n15 + 4 > x\r\nx < 19\r\n<====|=========o---------|---------|---->\r\n    18        19        20        21         \r\n\r\n\r\n\r\n	\N	\N	a) x ≤ 15/13  b) x < 19	Scott	Caroline	1
236	7	26	The point (3, 2) is on the line y = 2x + b. Find the value of b. Graph the line.	\r\n	2014-07-23 18:39:41.551045	2014-10-27 16:41:11.56954	b = -4 |\r\n2 = 6 + b\r\nb = -4\r\ny = 2x - 4\r\n	\N	PBL_ans_26_7.PNG	b = -4	Suzana	Henry	1
237	8	26	Are (2, 9) and (−3,−6) both on the line y = 4x+6?\r\nIf not, find an equation for the line that does pass through both points.	\r\n	2014-07-23 18:49:35.99636	2014-10-27 16:41:43.42458	(2,9) no, (-3,-6) yes, y = 3x + 3 |\r\ny = 4x + 6\r\n9 = 4(2) + 6? no for (2, 9) 9 != 14\r\n-6 = 4*(-3) + 6, yes for (-3, -6), -6 = -6\r\nslope is (9- -6)/(2 - -3) or 15/5 or 3\r\n9 = 3(2) + b\r\nb = 3\r\ny = 3x + 3	\N	PBL_ans_26_8.PNG	(2,9) no, (-3,-6) yes, y = 3x + 3 	Miranda	Caroline	1
248	9	27	Let P = (x, y) and Q = (1, 5). Write an equation that states that the slope of line PQ is 3. Show how this slope equation can be rewritten in the form y−5 = 3(x−1). This linear equation is said to be in 'point-slope form'. Explain the terminology. Find coordinates for three different points P that fit this equation.	\r\n	2014-07-24 01:37:38.656318	2014-10-27 16:47:33.570885	(y - 5)/(x - 1) = 3 |\r\ny - 5 = 3(x - 1)\r\nThe coefficient before the term on the right is the slope of the line.\r\nThe number subtracted from 5 is y when the number subtracted from x is 1.\r\n(1,5), (2,8), (3,11), (0,2)\r\n\r\ny = 3x - 3 + 5\r\ny = 3x + 2	\N	\N	(y - 5)/(x - 1) = 3		Hannah	1
249	10	27	(Continuation) What do the lines y = 3(x−1)+5, y = 2(x−1)+5, and y = −1/2(x−1)+5 all have in common? How do they differ from each other?		2014-07-24 01:44:14.742012	2014-10-27 16:47:57.981597	They all pass through the point (1,5), but they have different slopes |	\N	PBL_ans_27_10.PNG	--		Hannah	1
245	6	27	A toy manufacturer is going to produce a new toy car. Each one costs $3 to make, and the company will also have to spend $200 to set up the machinery to make them.\r\n(a) What will it cost to produce the first hundred cars? the first n cars?\r\n(b) The company sells the cars for $4 each. Thus the company takes in $400 by selling one hundred cars. How much money does the company take in by selling n cars?\r\n(c) How many cars does the company need to make and sell in order to make a profit?	\r\n	2014-07-24 01:21:10.013704	2014-10-27 16:46:08.806406	a) $500, b) $4n, c) >200 cars | \r\na( first 100 cars = 200 + (100*3), first n cars = 200 + (3n)\r\nb) 4n - (200 + 3n) -> n - 200\r\nc) 201 cars or more. \r\n\r\ncheck= 201 * 4 = 804 - (200 + 603) = $1 profit.	\N	\N	a) $500, b) $4n, c) >200 cars	Lucia	Nicole, Jared	1
242	3	27	Find the x-intercept and the y-intercept of the equation y = −(3/2)x + 6. Graph	\r\n	2014-07-24 01:07:21.916651	2014-10-27 16:44:31.388931	x int: 4, y int: 6 |\r\nx intercept = 4\r\ny intercept = 6	\N	PBL_ans_27_3.PNG	x int: 4, y int: 6	Scott	Matt	1
240	1	27	If you double all the sides of a square, a larger square results. By what percentage has the perimeter increased? By what percentage has the area increased?	\r\n	2014-07-23 19:06:33.699894	2014-10-27 16:43:33.81407	p: 100%, a: 300% |\r\nsquare side 1, area = 1, perimeter = 4\r\nsquare side 2, area = 4, perimeter = 8\r\nsquare side 4, area = 16, perimeter = 16\r\nsquare side 8, area = 64, perimeter = 32\r\nArea is 4 times bigger or 400 percent, perimeter is 2 times bigger 200 percent.	\N	\N	p: 100%, a: 300%	Lucia	Caroline, Nicole, Shantanu	1
250	11	27	Another word chain: Turn big into red into win. Change one letter at a time, always spelling real words.		2014-07-24 01:46:36.179574	2014-10-27 16:48:21.82935	big - bid - bed - red - rid - bid - bin - win |	\N	\N	--		Henry	1
251	1	28	Given that 48 ≤ n ≤ 1296 and 24 ≤ d ≤ 36, what are the largest and smallest values that the expression n/d can possibly have? Write your answer smallest ≤ and ≤ largest	\r\n	2014-07-24 01:50:19.030643	2014-10-27 16:48:58.213555	4/3 ≤ n/d ≤ 54 |\r\n48/36  ≤ n/d ≤ 1296/24	\N	\N	4/3 ≤ n/d ≤ 54	Miranda	Liam	1
247	8	27	A cyclist rides 30 km at an average speed of 9 km/hr. At what rate must the cyclist cover the next 10 km in order to bring the overall average speed up to 10 km/hr.?	\r\n	2014-07-24 01:32:33.376314	2014-10-27 16:47:07.065957	15 kph | \r\n30/9 + 10/t = 4 since to average 10 km/h the cyclist must cover 40 km in 4 hours.\r\n10/t = 36/9 - 30/9\r\n10/t = 6/9\r\n6/9t = 10\r\n6t = 90\r\nt = 15, the cyclist needs to go 15 k/h to average 10 k/h\r\n\r\ncheck: 30/9 + 10/15 = 3 1/3 + 1/3 = 4	\N	\N	15 kph	Maya, Miranda, Lucia, Scott	Matt, Matt, Nicole	1
243	4	27	The graph shows how the length (measured in cm) of a pendulum is related to the time (measured in sec) needed for the pendulum to make one complete back-and-forth movement (which is called the period). Find the length of a pendulum that swings twice as often as a 30-cm pendulum.	\r\n	2014-07-24 01:13:36.603451	2014-10-27 16:45:01.783587	7 cm | \r\nA 30 cm length takes ~1.1 second per swing, so we need a swing of about .55 seconds.\r\nThat would appear to be about 7 cm.\r\n\r\n	PBL_27_4.PNG	\N	7 cm	Zach	Ben	1
244	5	27	How far apart on a number line are\r\n(a) 12 and 18? (b) 12 and −7? (c) −11 and −4?	\r\n	2014-07-24 01:15:32.189599	2014-10-27 16:45:32.473891	6, 19, 7 | \r\na) 6\r\nb) 19\r\nc) 7	\N	\N	6, 19, 7	Matt V.	Simon	1
239	10	26	In each of the following, describe the rate of change between the first pair and the second, assuming that the first coordinate is measured in minutes and the second coordinate is measured in feet. What are the units of your answer?\r\n(a) (2, 8) and (5, 17) \r\n(b) (3.4, 6.8) and (7.2, 8.7) \r\n(c) (3/2,−3/4) and (1/4, 2)	\r\n	2014-07-23 19:03:38.012657	2014-10-27 16:42:56.808445	a) 3 fpm, b) 0.5 fpm, c) -2.2 fpm |\r\na) (17-8)/(5-2) = 9/3 = 3 feet per minute\r\nb) (8.7-6.8)/(7.2-3.4) = 1.9/3.8  = 0.5 of a foot per minute\r\nc) (2 - -3/4)/(1/4 - 3/2) = 2.75/-1.25 = -2,2 feet per minute\r\nor (11/4)/(-5/4) = -11/5	\N	\N	a) 3 fpm, b) 0.5 fpm, c) -2.2 fpm	Maya	Shantanu	1
252	2	28	Jess has 60 ounces of an alloy that is 40% gold. How many ounces of pure gold must be added to this alloy to create a new alloy that is 75% gold?	\r\n	2014-07-27 03:58:03.076829	2014-10-27 16:49:27.980533	84 oz. |\r\no/.4 = 60, o = 24 ounces in pure gold in original sample\r\n24 + n/(60 + n) = .75\r\n24 + n = .75(60 + n)\r\nn + 24 = 45 + .75n\r\n.25n = 21\r\nn = 21/.25\r\nn = 84 ounces must be added. Final total weight is 144 ounces, with 108 ounces of pure gold.\r\ncheck: 24 + 84 = (60 + 84) * .75\r\n108 = 108\r\n	\N	\N	84 oz.	Scott	Ben, Sam	1
241	2	27	Given the five numbers 8/25, 13/40, 19/60, 33/100, and 59/180, find the two that are closest together on a number line, and find the distance between them.	\r\n	2014-07-24 01:02:36.27247	2014-10-27 16:44:02.777027	33/100<->59/180, 0.00222 |\r\n8/25 = 64/200 = .32\r\n13/40 = 65/200 = .325\r\n19/60 = 57/180 = .31667\r\n33/100 = 66/200 = .33\r\n59/180 = .327777\r\n.3167 - .32 - .325 - .3277 - .33\r\n   .0033   .005   .00277  .002223\r\nClosest ar 59/180 and 33/100, they are .00222223 apart	\N	\N	33/100<->59/180, 0.00222	Avery	Liam, Jared, Nicole	1
130	5	15	It takes one minute to fill a four-gallon container at the Exeter spring. How long does it take to fill a six-gallon container? Fill in the missing entries in the table below, and plot points on the grid at right.\r\n---------------------------------------------------\r\n| 1  |    |    | 2  |    | 3  |    | 4  |    | 5  | \r\n|--------------------------------------------------\r\n| 4  | 5  | 6  |    | 11 |    | 14 |    | 19 |    |\r\n---------------------------------------------------\r\nNotice that it makes sense to connect the dots you plotted (thereby forming a continuous pattern). Is the same true of the sunset-time graph you looked at recently? Explain.		2014-07-14 04:11:10.321784	2014-07-24 04:30:30.060299	---------------------------------------------------\r\n| 1  |1.25| 1.5| 2  |2.75| 3  | 3.5| 4  |4.75| 5  | \r\n|--------------------------------------------------\r\n| 4  | 5  | 6  | 8  | 11 | 12 | 14 | 16 | 19 | 20 |\r\n---------------------------------------------------	PBL_Graph_15_5a.PNG	pbl_ans_15_5.PNG	\N	\N	\N	\N
36	4	4	Profits for the Whirligig Sports Equipment Company for six fiscal years, from 1993 through 1998, are graphed at right. The vertical scale is in millions of dollars. Describe the change in profit from\r\n(a) 1993 to 1994;\r\n(b) 1994 to 1995;\r\n(c) 1997 to 1998.\r\nDuring these six years, did the company make an overall profit or sustain an overall loss? What was the net change?		2014-07-09 04:19:49.81674	2014-07-24 16:29:58.157419	a) down 1.1%\r\nb) down 3.2%\r\nc) done 1.7%\r\n2.6+1.5-1.7+1.8-0.6-2.3 = net profit of 1.3 million\r\n\r\n	PBL_Graph_4_4.PNG	\N	\N	\N	\N	\N
102	9	11	There are 396 persons in a theater. If the ratio of women to men is 2:3, and the ratio of men to children is 1:2, how many men are in the theater? .		2014-07-12 15:41:06.912791	2014-07-24 16:35:57.862393	Men           Women           Children             Total\r\n100           150             200                  450\r\n 80           120             160                  360\r\n\r\nm + 3/2m + 2m = 396\r\n2m + 3m + 4m = 792\r\n9m = 792\r\nm = 88\r\n\r\nCheck:  88 + 132 + 176 = 396	PBL_Graph_11_9.PNG	\N	\N	\N	\N	\N
120	1	14	The graph displays the time of sunset at Exeter during September. Some questions:\r\n\r\nAt what time did the sun set on the 5th of September? on the 30th of September?		2014-07-12 20:33:21.101344	2014-07-24 16:36:40.47957	Sept. 5 - a little before 7:10\r\nSept. 30 - a little after 6:26	PBL_Graph_14_1_6_1_.PNG	\N	\N	\N	\N	\N
145	3	17	Sandy recently made a 210-mile car trip, starting from home at noon. The graph at right shows how Sandy’s distance from home (measured in miles) depends on the number of hours after noon. Make up a story that accounts for the four distinct parts of the graph. In particular, identify the speed at which Sandy spent most of the afternoon driving.		2014-07-14 19:39:31.026864	2014-07-24 16:44:56.528467	For the first hour Sandy was in local traffic averaging 30 mpg. Then she got on the highway and was able to average 60 mph. She stopped for food after 2 hours and spent 1 hour. Then she drove 2 more hours on the freeway at 60 mph. So for the majority of the day she was driving at 60 mph, although her average speed was only a bit over 40 for the whole trip.	PBL_Graph_17_3.PNG	\N	\N	\N	\N	\N
152	1	18	To do a college visit, Wes must make a 240-mile trip by car. The time required to complete the trip depends on the speed at which Wes drives, of course, as the table below shows. Fill in the missing entries, and\r\nplot points on the grid provided. Do the quantities time and speed vary directly? It makes sense to connect your plotted points with a continuous graph. Explain why.\r\n\r\n         ---------------------------------------------------\r\nspeed    | 15 | 20 | 25 |    |    | 48 |    | 60 |    | r  | \r\n         |--------------------------------------------------\r\ntime     |    | 12 |    |  8 |  6 |    | 4.8|    |  3 |    |\r\n         ---------------------------------------------------		2014-07-14 20:18:13.60202	2014-07-24 16:45:44.037068	         ---------------------------------------------------\r\nspeed    | 15 | 20 | 25 | 30 | 40 | 48 | 50 | 60 | 80 | r  | \r\n         |--------------------------------------------------\r\ntime     | 16 | 12 | 9.6|  8 |  6 | 5  | 4.8|  4 |  3 | d/r|\r\n         ---------------------------------------------------\r\nThey vary directly but inversely, as one goes up the other goes down at the same ratio.	PBL_Graph_18_1a.PNG	\N	\N	\N	\N	\N
159	7	18	Shown at right, the y-block and xy-block are two more members of the algebra-block family. Draw an algebra-block diagram that illustrates the equation (1 + x)y = y + xy.		2014-07-15 06:19:10.992103	2014-07-24 16:46:41.510458	   XXXXXXXXXXXXXXXXX\r\n   X   |           X\r\ny  X   |           X\r\n   X   |           X\r\n   XXXXXXXXXXXXXXXXX\r\n     1       x \r\n	PBL_18_7.PNG	\N	\N	\N	\N	\N
165	6	19	At noon one day, the Exeter River peaked at 11 feet above flood stage. It then began to recede, its depth dropping at 4 inches per hour. \r\n(a) At 3:30 that afternoon, how many inches above flood stage was the river?\r\n(b) Let t stand for the number of hours since noon, and h stand for the corresponding number of inches that the river was above flood stage. Make a table of values, and write an equation that expresses h in terms of t.\r\n(c) Plot h versus t, putting t on the horizontal axis.\r\n(d) For how many hours past noon was the river at least 36 inches above flood stage?		2014-07-16 05:17:57.899393	2014-07-24 16:48:46.968094	a) 9 feet, 10 inches\r\nb) time   } 12 |  1  |  2  |  3  |  4  |  t  |\r\n   height | 11 |10.67|10.33| 10  |9.67 | 11-(t*.33)\r\nc) attached\r\nd) 11-(.33t) = 3  ->  -.33t = -8  ->   t = 24 hours\r\n\r\n	\N	PBL_Graph_ans_19_6.PNG	\N	\N	\N	\N
168	1	20	Jess and Taylor go into the cookie-making business. The chart shows how many dozens of cookies were baked and sold (at $3.50 per dozen) during the first six days of business.\r\n(a) What was their total income during those six days?\r\n(b) Which was more profitable, the first three days or the last three days?\r\n(c) What was the percentage decrease in sales from Tuesday to Wednesday? What was the percentage increase in sales from Wednesday to Thursday?\r\n(d) Thursday’s sales were what percent of the total sales?\r\n(e) On average, how many dozens of cookies did Jess and Taylor bake and sell each day?		2014-07-16 05:38:47.902366	2014-07-24 16:49:05.630876	a) 12 + 24 + 10 + 16 + 20 + 14 = 96 * 3.50 = $336.00.\r\nb) First 3, 46 dozen, Second three, 50 dozen, the second three days.\r\nc) 58.3%, 60%\r\nd) 16/96 = 16.67%\r\ne) 96/6 = 16.67	PBL_Graph_20_1.PNG	\N	\N	\N	\N	\N
214	4	24	Confirm that the five points in the table all lie on a single line. Write an equation for the line. Use your calculator to make a scatter plot, and graph the line on the same system of axes.		2014-07-21 04:56:26.830199	2014-10-27 15:22:00.908758	y = -2x + 1 |\r\nThey vary consistently as each time x goes up by 1, y goes down by 2, i.e. slope is -2, y intercept is 1\r\ny = -2x + 1\r\n	PBL_24_4.PNG	PBL_ans_24_4.PNG	y = -2x + 1	Alex	Ben	1
262	12	28	Find an equation for the line containing the points (−3, 0) and (0, 4).		2014-07-27 05:10:30.611234	2014-10-27 17:03:21.358393	 3y = 4x + 12\r\n-4x + 3y = 12\r\n	\N	\N	y = 4x/3 + 4		Henry	1
265	2	29	Casey goes for a bike ride from Exeter to Durham, while an odometer keeps a cumulative record of the number of miles traveled. The equation m = 12t + 37 describes the odometer reading m after t hours of riding. What is the meaning of 12 and 37 in the context of this trip?		2014-07-27 05:27:48.999025	2014-10-06 18:34:43.247886	12 for Casey, 37 beginning reading |\r\n12 is the slope (m), which in this case indicates 12 mph.\r\n37 is the beginning odometer reading, which is also the y intercept.	\N	\N		Matt V	Caroline	1
312	3	33	Solve the equation C = 5/9 (F − 32) for F.		2014-07-29 16:16:12.520807	2014-10-23 14:13:02.601688	C = 5/9(F) − 32\r\n9C = 5F - 160\r\nC = 5F/9 - 160/9	\N	\N	C = 5/9(F) − 32	Garrett	Henry, Matt, Simon, Nicole, Caroline	1
259	9	28	On a number line, how far is each of the following numbers from 5?\r\n(a) 17 (b) −4 (c) x (d) x + 3 (e) x − 1		2014-07-27 04:45:34.644762	2014-10-27 17:02:07.459362	a) 12\r\nb) 9\r\nc) |x - 5|\r\nd) |x - 2|\r\ne) |x - 6|	\N	\N	a) 12, b) 9, c) |x - 5| d) |x - 2| e) |x - 6|		Julia	1
263	13	28	Multiply x + 2y by 3y. Draw an algebra-block diagram to illustrate this calculation.		2014-07-27 05:16:46.259367	2014-10-27 17:03:32.925479	6y² + 3xy\r\n\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n y X      | | X\r\n   XXXXXXXXXXXX\r\n      x    y y  	\N	\N	6y² + 3xy			1
270	7	29	A recent CNN poll about crime in schools reported that 67% of Americans approved of a bill being debated in Congress. The CNN report acknowledged a 3% margin of error.\r\n(a) Make a number-line graph of the range of approval ratings in this report.\r\n(b) Explain why the range of approval ratings can be described by |x − 0.67| ≤ 0.03.		2014-07-27 06:20:03.256679	2014-10-07 15:01:23.564481	a) ----*====|====|====X====|====|====*----|\r\n      64   65   66   67   68   69   70    71\r\n\r\nb)  |x − 0.67| ≤ 0.03  describes a range of values that is within 0.03 of .67 both above and below.	\N	\N	--	Avery	Benji, Hannah	1
266	3	29	Find an equation for the line that passes through the points (4.1, 3.2) and (2.3, 1.6).		2014-07-27 05:35:57.642901	2014-10-27 17:20:10.441651	(y - 3.2) = 8/9(x - 4.1) |\r\nSlope is 1.6/1.8, or 8/9\r\n(y - 3.2) = 8/9(x - 4.1)\r\nor\r\n9y - 28.8 = 8x - 32.8\r\n9y = 8x - 4\r\ny = 8/9x - 4/9	\N	PBL_ans_29_3.PNG	(y - 3.2) = 8/9(x - 4.1)	Matt K	Jared, Nicole	\N
260	10	28	Interpret each of the following as the distance between two numbers on a number line.\r\n(a) |x − 7| (b) |3 − x| (c) |x + 5| (d) |x|	\r\n	2014-07-27 04:55:34.024054	2014-10-27 17:02:47.313533	a) two numbers that are 7 apart, i.e. 7,0   10,3   3,-4  or  -10, -17\r\nb) two numbers that are 3 apart, i.e. 3,0   10,7   1,-2  or  -10, -13\r\nc) two numbers that are 5 apart, i.e. 0,5   5,10   5,-5  or  -10, -5\r\nd) difference between x and the origin	\N	\N	--		Caroline	1
256	6	28	Write an equation for the line that contains the points in the table, and make up a context for it.	\r\n	2014-07-27 04:31:45.141582	2014-10-27 17:01:12.298936	y = 4x + 100 | \r\n(y - 100) = 4x\r\nor \r\ny = 4x + 100\r\n\r\nStarting from a base score of 100, you get 4 points for each right answer on a test.\r\n	PBL_Graph_28_6.PNG	\N	y = 4x + 100	Avery	Sam	1
257	7	28	On a number line, how far is each of the following numbers from zero?\r\n(a) 45 (b) −7 (c) x (d) x + 2 (e) 0	\r\n	2014-07-27 04:33:56.180619	2014-10-27 17:01:39.417398	a) 45, b) 7, c) |x|, d) |X+2|, e) 0 | \r\na) 45\r\nb) 7\r\nc) |x|\r\nd) |x + 2|\r\ne) 0	\N	\N	a) 45, b) 7, c) |x|, d) |X+2|, e) 0	Zach	Shantanu	1
267	4	29	Find coordinates for all the points on a number line that are\r\n(a) six units from 0; (b) six units from four; (c) six units from −7; (d) six units from x.		2014-07-27 05:39:15.808557	2014-10-06 18:38:02.207365	a)(6, -6) b)(-2, 10) c)(-13, -1) d)(x+6, x-6) |	\N	\N		Lucia	(Benji)	\N
268	5	29	Rearrange the eight words “between”, “4”, “the”, “17”, “is”, “and”, “x”, and “distance” to form a sentence that is equivalent to the equation |x−17| = 4. By working with a number line, find the values of x that fit the equation 		2014-07-27 05:44:10.37886	2014-10-07 14:49:17.291404	4 is the distance between 17 and x.\r\n13 and 21.\r\n----*---------|---------|---------|---------|---------|---------|---------|---------*---------|----\r\n   13        14        15        16        17        18        19        20        21        22	\N	\N		Lucia	Julia	\N
271	8	29	Translate the sentence “the distance between x and 12 is 20” into an equation using algebraic symbols. What are the values of x being described?		2014-07-27 06:21:32.970987	2014-10-07 15:02:08.712269	 x could be either 32 or -8.	\N	\N	|x - 12| = 20		Henry, Matthew	1
264	1	29	Write an equation in point-slope form for\r\n(a) the line that goes through (2, 5) and (6,−3);\r\n(b) the line that goes through point (h, k) and that has slope m.		2014-07-27 05:23:42.363714	2014-10-06 18:34:27.780364	a) (y-5) = -2(x-2) or (y+3)=-2(x-6)  |\r\na) (y - 5) = -2(x - 2)  check-  y intercept = 9,  x - intercept = 4.5\r\nb) (y - k) = m(x - h)\r\n	\N	\N		Scott	Hannah, Tori, Caroline	\N
311	2	33	Write (x + 1)(x + 2) without parentheses. Explain how the diagram at right illustrates this product.		2014-07-29 16:13:03.346169	2014-10-23 14:04:08.844818	x*2 + 3x + 2\r\n\r\nThe diagram illustrates the product because it contains one box that is x each way, or x^2, three boxes that are 1 each way and x the other, or 3x, and two boxes that are 1 by 1, or 2 total.	PBL_graph_33_1.PNG	\N	x^2 + 3x + 2	Jason	Jared	1
258	8	28	Solve \r\n(a) A = 1/2 bh for b; \r\n(b) A = 2πrh + πr² for h.		2014-07-27 04:38:18.385302	2014-10-27 17:01:58.550309	a) 2A = bh -> b = 2A/h\r\nb) b = (A - πr²)/2πr	\N	\N	a) 2A/h, b) (A-πr²)/2πr	Lucia	Jared, Nicole	1
278	5	30	Verify that (0, 4) is on the line 3x+2y = 8. Find another point on this line. Use these points to calculate the slope of the line. Is there another way to find the slope of the line?		2014-07-27 16:46:30.655056	2014-10-08 16:20:14.457229	3x+2y = 8\r\n3*0 + 2*4 = 8 is true, so (0, 4) is on the line.\r\n(8/3, 0) is also on the line.\r\nThe slope would be (-4/(8/3)) or -12/8 or -3/2.\r\nAnother way to find the slope is to put the equation into y = mx + b form.\r\n2y = -3x + 8\r\ny = -3/2x + 4	\N	\N	m = -3/2		Nicole	1
275	2	30	Translate the sentence “x and y are twelve units apart” into algebraic code. Find a pair (x, y) that fits this description. How many pairs are there?		2014-07-27 15:58:19.327763	2014-10-08 16:06:34.599562	|x - y| = 12\r\n-7, 5\r\nAn infinite number of pairs.	\N	\N	|x - y| = 12, infinite	Jaden, Jason, Lucia	Benji	1
273	10	29	Translate “x is 12 units from 20” into an equation. What are the values of x being described?		2014-07-27 06:33:08.839199	2014-10-07 15:28:06.05986	|x - 12| = 20 (8, 32) |\r\n	\N	\N	|x - 12| = 20 (8, 32) 	Garrett	Simon	1
281	8	30	After successfully solving an absolute-value problem, Ariel spilled Heath Bar Crunch R ⃝ all over the problem. All that can be read now is, “The distance between x and (mess of ice cream) is (another mess of ice cream).” Given that Ariel’s answers are x = −3 and x = 7, reconstruct the missing parts of the problem.		2014-07-27 17:01:28.821117	2014-10-08 16:24:30.600407	Given that the total distance between -3 and 7 is 10, we need a number 5 away from each. That would be 2, so the answer is 'the distance between x and 2 is 5'.	\N	\N	|x - 2| = 5	Suzana, Scott, Miranda, Lucia, Maya	Caroline	1
279	6	30	Graph a horizontal line through the point (3, 5). Choose another point on this line. \r\nWhat is the slope of this line? \r\nWhat is the y-intercept of this line? \r\nWhat is an equation for this line? \r\nDescribe a context that could be modeled by this line.		2014-07-27 16:52:30.121817	2014-10-08 16:21:19.796684	(0, 5) is on the line.\r\nThe slope is 0.\r\nThe y intercept is 5.\r\nThe equation is y = 0*x + 5 or just y = 5.\r\nIf a bike's odometer reads 5 and is left in the garage (i.e. speed/slope is 0) it will continue to read 5 no matter how much time passes.	\N	PBL_ans_30_6.PNG	y = 5, 		Henry, Matthew	1
280	7	30	Graph a vertical line through the point (3; 5). Does this line have a slope or y-intercept?\r\nWhat is an equation for this line? Describe a context that could be modeled by this line.		2014-07-27 16:57:48.769733	2014-10-08 16:22:46.737377	The slope is infinite and the line never intercepts the y axis.\r\nx = 3.\r\nA bunch of vehicles of different speeds will all have traveled the same distance (0) if no time is allowed to elapse.\r\n	\N	\N	no, x = 3	Matt K, Miranda	Liam	1
283	10	30	The average of three different positive integers is 8.\r\nWhat is the largest integer that could be one of them?		2014-07-27 17:43:28.175437	2014-10-08 16:29:05.748846	Since the integers are positive, the smallest possible values for the other two would be 1. To get an average of 8 for 3 integers, the sum of the 3 must be 24. Take away a 1 and a 2 as they must be different, and the largest possible third number would be 21.	\N	\N	21	Lucia, Scott, Jaden, 	(Liam)	1
284	11	30	A handicapped-access ramp starts at ground level and rises 27 inches over a distance of 30 feet. What is the slope of this ramp?		2014-07-27 17:46:20.001026	2014-10-10 13:55:24.186615	30 feet times 12 is 360 inches.\r\nThe ramp rises 27/360 per inch, so the slope is 0.075.\r\nWe could also do this as 2.25 feet over 30 feet, 2.25/30, which yields the same answer.	\N	\N	0.075 or 3/40	Jaden, Matt V. 	Benji	1
282	9	30	The figure shows the graph of 20x + 40y = 1200. Find the x- and y-intercepts, the slope of the line, and the distances between tick marks on the axes. Duplicate this figure on your calculator. What window settings did you use?		2014-07-27 17:41:17.847093	2014-10-10 13:51:43.824075	20x + 40y = 1200\r\n40y = -20x + 1200\r\ny = -1/2x + 30\r\ny intercept is 30 (1200/40)\r\nx intercept is 60 (1200/20)\r\nslope is -1/2.\r\nThe y tick marks are 10 apart.\r\nThe x tick marks are 5 apart.\r\nSee attached	PBL_30_9.PNG	PBL_ans30_9.PNG	x: 60, y: 30, m = -1/2	Scott	Shantanu, Jarod	1
285	12	30	Jay thinks that the inequality k < 3 implies the inequality k^2 < 9, but Val thinks otherwise. Who is right, and why?		2014-07-27 17:50:37.55737	2014-10-10 13:57:04.03985	Jay is not right. k^2 is the same as k*k, thus if k < 3, it should be so that k*k < 3*3. But when k is -4, k*k is 16, which is not less than 9.\r\n	\N	\N	Val is right	Maya, Miranda	Henry, Matthew	1
286	1	31	The specifications for machining a piece of metal state that it must be 12 cm long,  within a 0.01-cm tolerance. What is the longest the piece is allowed to be? What is the shortest? \r\nUsing l to represent the length of the finished piece of metal, write an absolute value inequality that states these conditions.		2014-07-27 17:53:23.674237	2014-10-10 14:15:05.647927	The longest is 12.01 cm.\r\nThe shortest is 11.99 cm.\r\n11.99 <= l <= 12.01.	\N	\N	|l-12| = .01	Scott	Nicole, Hannah	\N
287	2	31	A movie theater charges $6 for each adult and $3 for each child. If the total amount in ticket revenue one evening was $1428 and if there were 56 more children than adults, then how many children attended?		2014-07-28 00:26:26.045189	2014-10-10 14:22:04.033597	6a + 3(a+56) = 1428\r\n9a + 168 = 1428\r\n9a = 1260\r\na = 140 adults attended, and 196 children attended\r\n\r\ncheck: 140*6 + 196*3 = 1428	\N	\N	196 children	Matt V	Christian, Hannah, Simon	\N
277	4	30	In class, Evan read −75 < 2 as “negative 75 is less than 2.” Neva responded by saying “I’m thinking that −75 is a larger number than 2.” How would you resolve this apparent conflict?		2014-07-27 16:41:39.865849	2014-10-08 16:18:04.438303	-75 is to the left of 2 on the number line, which makes it less. However, its magnitude, or absolute value, is 75, which of course is greater than 2.	\N	\N	--		Sam	1
276	3	30	The equation |x − 7| = 2 is a translation of “the distance from x to 7 is 2.”\r\n(a) Translate |x − 7| ≤ 2 into English, and graph its solutions on a number line.\r\n(b) Convert “the distance from −5 to x is at most 3” into symbolic form, and solve it.		2014-07-27 16:08:17.780739	2014-10-08 16:17:42.314287	a) 'The distance from x to 7 is less than or equal to 2.\r\n\r\n--*====|====|====|====*----|----\r\n  5    6    7    8    9   10\r\n\r\nb) |-5 - x| ≤ 3 \r\n-8 ≤ x ≤ -2\r\n\r\n--*====|====|====|====|====|====*----|----|----\r\n -8   -7   -6   -5   -4   -3   -2   -1    o	\N	\N	|x+5| ≤ 3, -8 ≤ x ≤ -2	Maya, Lucia, Miranda	Tori	1
313	4	33	Draw the line through the point (0, 6) whose slope is 2/3. If you move 24 units to the right of (0, 6), and then move up to the line, what is the y-coordinate of the point you reach?		2014-07-29 16:24:12.194892	2014-10-23 14:13:24.378022	The point would have an x coordinate of 24. The line equation is y = 2x/3 + 6. Solving for x = 24,  y = 48/3 + 6, or 22.	\N	PBL_ans_33_4.PNG	22	Scott	Hannah, Tori	1
314	5	33	(Continuation) Find an equation for the line. What is the x-intercept of the line?		2014-07-29 16:30:40.580451	2014-10-23 14:34:06.86455	Equation is y = 2x/3 + 6\r\nx intercept is -9\r\n	\N	\N	y = 2x/3 + 6, -9	Jaden	Hannah, Tori	1
294	9	31	Given that 0.0001 ≤ n ≤ 0.01 and 0.001 ≤ d ≤ 0.1, what are the largest and smallest values that nd can possibly have? Write your answer smallest ≤ nd ≤ largest		2014-07-28 02:03:12.543705	2014-10-17 16:20:50.108357	smallest is .0001/.1 or .001\r\nlargest is .01/.001 or 10	\N	\N	.001 ≤ n/d ≤ 10	Maya, Matt K.	Benji	1
293	8	31	Write two equations without absolute value symbols that, in combination, are equivalent to |3x + 5| = 12. Solve each of these two equations.		2014-07-28 01:43:58.752243	2014-10-17 16:16:15.494967	3x + 5 = 12\r\n3x = 7\r\nx = 7/3\r\n\r\n3x + 5 = -12\r\n3x = -17\r\nx = -17/3\r\n\r\ncheck: 3(7/3) + 5 = 12,  3(-17/3) + 5 = 12	\N	\N	x = 7/3 or x = -17/3	Jaden	Hannah, Tori	\N
292	7	31	If |x + 1| = 5, then x + 1 can have two possible values, 5 and −5. This leads to two equations, x + 1 = 5 and x + 1 = −5. If |2x − 7| = 5, what possible values could the expression 2x − 7 have? Write two equations using the expression 2x − 7 and solve them.		2014-07-28 01:41:29.264255	2014-10-09 16:18:15.115257	2x - 7 could equal 5 or -5\r\n2x - 7 = 5\r\n2x = 2\r\nx = 1\r\n2x - 7 could equal 5 or -5\r\n2x - 7 = -5\r\n2x = 12\r\nx = 6\r\n\r\ncheck: 2 - 7 = -5, 12 - 7 = 5	\N	\N	x = 1 or x = 6	Matt V.		1
295	10	31	A 'lattice point' is defined as a point whose coordinates are integers. If (−3, 5) and (2, 1) are two points on a line, find three other lattice points on the same line.		2014-07-28 02:13:40.950086	2014-10-17 16:23:10.499839	slope is -4/5,\r\n-8,9\r\n7,-3\r\n12,-7\r\n	\N	PBL_ans_31_10.PNG	any in y = -4/5(x-2) + 1	Jaden	Nicole	\N
296	11	31	The equation 13x + 8y = 128 expresses a linear relationship between x and y. The point (5, 8) is on, or above, or below the linear graph. Which is it? How do you know?		2014-07-28 02:16:32.537477	2014-10-17 16:24:12.508039	13x + 8y = 128\r\n13x + 64 = 128\r\n13x = 64 \r\nx = 4.923 is on the line, thus 5 is slightly above the line.\r\n	\N	\N	above the line ( 5 > 4.923)	Garrett	Caroline	1
301	5	32	The data in each table fits a direct variation. Complete each table, write an equation to model its data, and sketch a graph.		2014-07-29 00:06:18.081293	2014-10-21 14:06:48.189801	-\r\nx  2  4  6  12         y = 3/2x\r\ny  3  6  9  18\r\n\r\nx  2   3   5   8       y = -4x \r\ny -8 -12 -20 -32	PBL_graph_32_5.PNG	PBL_ans_32_5.PNG	y = 3x/2,   y = -4x	Jaden	Jared. Benji, Caroline	1
297	1	32	Show that the equation y = (7/3)x − 11/8 can be rewritten in the standard form ax+by = c, in which a, b, and c are all integers. 		2014-07-28 02:20:51.587962	2014-10-21 13:43:15.015977	y = (7/3)x − 11/8\r\n-(7/3)x + y = -11/8\r\n-(56/3)x + 8y = -11\r\n-56x + 24y = -33	\N	\N	56x - 24y = 33	Suzana	Julia, Nicole	1
290	5	31	(Continuation) Let y be the distance between the handcar and the Newfields Road bridge, which Pat and Kim reach at 11 am. Draw a graph that plots y versus t, for the entire interval 0 ≤ t ≤ 7. Write an equation that expresses y in terms of t. By the way, you have probably noticed that each of these absolute-value graphs has a corner point, which is called a 'vertex'.		2014-07-28 01:34:09.399904	2014-10-09 16:13:19.308622	-\r\nt   0   1   2   3   4   5   6   7\r\ny   3   2   1   0   1   2   3   4\r\n\r\ny = |3 - t|	\N	PBL_ans_31_5.PNG	y = |t - 3|	Avery		\N
300	4	32	Solve the equation 0.05x + 0.25(30 − x) = 4.90. Invent a context for the equation.		2014-07-28 23:20:09.228252	2014-10-21 13:53:58.651086	0.05x + 0.25(30 − x) = 4.90\r\n5x + 25(30 - x) = 490\r\n5x - 25x + 750 = 490\r\n20x = 260\r\nx = 13\r\n\r\ncheck:  65 + 25*(17) = 490  ->  490 = 490\r\nYou had to sell raffle tickets. You put in 5 cents for each raffle ticket you sold, but if you sold less than 30 you had to pay an extra 25 cents for each ticket less than 30. Since you sold only 13 you had to pay a 4.25 penalty.	\N	\N	x = 13	Jason	Henry, Matthew L. 	1
299	3	32	Find the value for h for which the slope of the line through (−5, 6) and (h, 12) is 3/4.		2014-07-28 23:07:30.247756	2014-10-21 14:00:24.756987	(12-6)/(h+5) = 3/4\r\n6 = 3/4(h + 5)\r\n24 = 3h + 15\r\n3h = 9\r\nh = 3\r\n\r\ncheck: slope would be (12-6)/(3-(-5)) -> 6/8  ->  3/4	\N	\N	h = 3	Lucia	Henry, Matthew L., Simon, Julia, Hannah	1
303	7	32	Blair’s average on the first five in-class tests is 67. If this is not pulled up to at least a 70, Blair will not be allowed to watch any more Law and Order reruns. To avoid losing those TV privileges, what is the lowest score Blair can afford to make on the last in-class test? Assume that all tests carry equal weight.		2014-07-29 07:09:39.809394	2014-10-21 14:21:17.173692	5*67 + t = 6*70\r\nt + 335 = 420\r\nt = 85\r\n\r\n	\N	\N	85	Lucia, Miranda, 	Liam, Hannah	1
305	9	32	I have 120 cm of framing material to make a picture frame, which will be most pleasing to the eye if its height is 2/3 of its width. What dimensions should I use?		2014-07-29 07:17:21.022868	2014-10-21 14:24:03.062871	Each length plus width will total 60, so we need 2/3 of 60 + w for the height. \r\n(5/3)w = 60\r\n5w =  180\r\nw = 36, h = 24\r\n\r\ncheck= 24/36 = 2/3	\N	\N	w=36 cm, h = 24 cm	Matt K.	Caroline	1
304	8	32	Sketch the graphs of y = 2x, y = 2x+1, and y = 2x−2 all on the same coordinate-axis system. Find the slope of each line. How are the lines related to one another?		2014-07-29 07:12:56.10938	2014-10-14 13:50:15.140328	graphs attached, they all have the same slope, 2. Only the y intercept is different.	\N	PBL_ans_32_8.PNG	M=2, lines parallel	Miranda		1
307	11	32	In each case, decide whether the three points given are collinear:\r\n(a) (−4, 8), (0, 2), and (2,−1) (b) (350, 125), (500, 300), and (650, 550)		2014-07-29 07:28:40.628334	2014-10-21 14:25:47.273246	(a) (−4; 8), (0; 2), and (2;−1)    yes, since the slope is -3/2 between each pair\r\n(b) (350; 125), (500; 300), and (650; 550)  no, the slope between the first two pairs is 1.1667, between the second two is 1.667 and between the first and last is 1.41667	\N	\N	a) yes, b) no	Alex	Simon	1
306	10	32	Describe the relationship between the following pairs of numbers:\r\n(a) 24 − 11 and 11 − 24 (b) x − 7 and 7 − x (c) |x − 7| and |7 − x|		2014-07-29 07:20:35.490533	2014-10-14 13:57:06.857702	(a) 24 − 11 and 11 − 24   ->  they are equally far away from 0 on opposite sides of the number line\r\n(b) x − 7 and 7 − x       ->  they are equally far away from 0 on opposite sides of the number line\r\n(c) |x − 7| and |7 − x|   ->  they are equal and non negative	\N	\N	a) opposites, b) opposites, c) equal	Scott		1
289	4	31	(Continuation) Graph the equation y = |x − 4| for 0 ≤ x ≤ 7. Interpret this graph in the current context. 		2014-07-28 00:38:28.880348	2014-10-17 16:14:30.806763	-\r\ny    | 4 | 3 |  2 |  1 |  0 |  1 |  2 |  3 |\r\nx    | 0 | 1 |  2 |  3 |  4 |  5 |  6 |  7 |\r\n\r\nAt noon the time resets back to 0 and then begins counting up again.	\N	PBL_ans_31_4.PNG	y is the distance of x from 4	Suzana	Henry, Matt	1
298	2	32	Fill in the blanks:\r\n(a) The inequality |x − 1.96| < 1.04 is equivalent to “x is between . and .”\r\n(b) The inequality |x−2.45| ≥ 4.50 is equivalent to “x is not between . and .”		2014-07-28 22:52:00.480048	2014-10-21 13:48:51.162763	a) x is between .92 and 3\r\nb) x is not between -2.05 and 6.95	\N	\N	a) .92,3.00   b. -2.05, 6.95	Matt K.	Hanna	1
330	10	34	Find the x- and y-intercepts of y = 5 − |x − 3|, find the coordinates of its vertex, and then sketch the graph of this equation.		2014-07-29 22:29:14.885211	2014-10-27 16:12:47.747703	y = 5 − |x − 3|\r\ny intercept = 2\r\nx intercepts are 8 and -2\r\nvertex is at (3, 5)\r\n	\N	PBL_ans_34_10.PNG	y int:2, x ints:-2,8, vertex:(3,5)	Alex	Sam, Shantanu, Hannah	1
328	8	34	Sketch on the same axes the graphs of\r\n(a) y = |x| (b) y = 2|x| (c) y = 0.5|x| (d) y = −3|x|		2014-07-29 22:22:32.142635	2014-10-24 14:46:45.786748	attached, the number in front of the absolute value part becomes the slope of the line, negative on one side and positive on the other.	\N	PBL_ans_34_8.PNG	coefficient becomes the slope of the two lines (one negative)	Maya	Benji, Shantanu	1
323	3	34	Find the x- and y-intercepts of y = |x − 3| − 5, find the coordinates of its vertex, and then sketch the graph of this equation.		2014-07-29 21:21:05.622447	2014-10-24 15:10:26.342408	y = |x − 3| − 5\r\ny intercept ->  y = |-3| - 5 or -2\r\nx intercept ->  |x - 3| = 5, x intercepts are 8 and -2.\r\nThe vertex is at ( 3, -5 )\r\n\r\n	\N	\N	y int: -2, x int:8 and -2,vertex (3,-5)	Avery	Hannah, Jared	1
326	6	34	Draw rectangles that are composed of x2-blocks, x-blocks, and 1-blocks to illustrate the results when the following binomial products are expanded:\r\n(a) (x + 2)(x + 3) (b) (2x + 1)(x + 1) (c) (x + 2)(x + 2)		2014-07-29 21:52:24.580177	2014-10-21 18:13:41.125881	(a) (x + 2)(x + 3)  ->  x^2 + 5x + 6\r\n   XXXXXXXXXXXXX\r\n   X     | | | X     \r\n x X     | | | X\r\n   X     | | | X   \r\n   X-----------X \r\n 1 X     | | | X\r\n   X-----------X\r\n 1 X     | | | X\r\n   XXXXXXXXXXXXX\r\n     x    1 1 1\r\n(b) (2x + 1)(x + 1)  ->  2x^2 + 3x + 1\r\n   XXXXXXXXX\r\n   X     | X     \r\n x X     | X\r\n   X     | X   \r\n   X-------X \r\n   X     | X   \r\n x X     | X\r\n   X     | X   \r\n   X-------X\r\n 1 X     | X\r\n   XXXXXXXXX\r\n      x   1 \r\n(c) (x + 2)(x + 2) ->  x^2 + 4x + 4\r\n   XXXXXXXXXXX\r\n   X     | | X     \r\n x X     | | X\r\n   X     | | X   \r\n   X---------X \r\n 1 X     | | X\r\n   X---------X\r\n 1 X     | | X\r\n   XXXXXXXXXXX\r\n     x    1 1	\N	\N	a) x^2 + 5x + 6  b) 2x^2 + 3x + 1   c) x^2 + 4x + 4	Jaden, Suzana		1
320	11	33	Randy phones Sandy about a homework question, and asks, “The vertex of the graph of y equals the absolute value of x plus four is (−4, 0), isn’t it?” Sandy answers, “No, the vertex is (0, 4).” Who is right? Explain.		2014-07-29 20:42:40.218635	2014-10-23 14:24:57.372605	It depends on how the question is interpreted. If it is |x + 4|, the vertex is at (-4, 0). If it is |x| + 4, the vertex is (0, 4).	\N	\N	|x+4| vs. |x|+4	Maya	Benji	\N
324	4	34	When weights are placed on the end of a spring, the spring stretches. If a three-pound weight stretches the spring to a length of 4.25 inches, a five-pound weight stretches the spring to a length of 5.75 inches, and a nine-pound weight stretches the spring to a length of 8.75 inches, what was the initial length of the spring?		2014-07-29 21:47:14.014954	2014-10-24 14:55:46.287423	5-3 or 2 pounds stretches it 5.75 - 4.25 = 1.5 inches or .75 inches per pound.\r\n9-5 or 4 pounds stretches it 8.75 - 5.75 = 3 inches, or again .75 inches per pound, so it appears to be a direct relationship between weight and stretch.\r\n0-3 would be 3 * .75 or 2.25 inches of stretch, so with 0 pounds the spring would be at 4.25-2.25 or 2 inches long.\r\n\r\ncheck: 2 + 9*.75 = 8.75	\N	\N	2 inches	Suzana	Henry, Matthew, Nicole, 	1
329	9	34	What effect does the coefficient a have on the graph of the equation y = a|x|? How can you tell whether a is positive or negative by looking at the graph?		2014-07-29 22:24:34.835325	2014-10-24 15:22:03.048644	A larger a makes for a steeper/narrower vee, and a smaller a makes for a wider one.\r\nIf the legs point up the value of a will be positive, and if they point down, negative.	\N	\N	coefficient:width/slope, sign:points up or down	Jason, Miranda	Sam	1
325	5	34	Given that y varies directly with x and that y = 60 when x = 20, find y when x = 12.		2014-07-29 21:49:08.253441	2014-10-24 15:18:41.739943	60/20 = y/12\r\n720/20 = y\r\ny = 36	\N	\N	36	Matt K.	Nicole	1
322	2	34	Find two different ways of determining the slope of the line 11x + 8y = 176.		2014-07-29 20:57:08.44874	2014-10-24 15:19:09.01466	1) convert to y = mx + b form. \r\n8y = -11x + 176\r\ny = -11x/8 + 22, slope is -11/8\r\n\r\n2) y intercept is 22, making (0,22) a point on the line\r\n   x intercept is 16, making (16,0) a point on the line\r\nslope becomes -22/16 or -11/8	\N	\N	-11/8	Scott	Caroline	1
319	10	33	Graph y = |x| + 3 and y = |x| − 5, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = |x| + k. How can you tell from the graph whether k is positive or negative?		2014-07-29 20:38:00.890212	2014-10-23 14:27:26.779411	The graph moves up k units if k is positive, or down k units if k is negative. So you can tell the sign of k by checking whether the vertex is above or below the x axis.	\N	PBL_ans_33_10.PNG	vertex above of below x axis	Lucia	Caroline	1
327	7	34	Solve for x: 1/2 (x − 2) + 1/3 (x − 3) + 1/4 (x − 4) = 10		2014-07-29 22:18:23.675789	2014-10-24 15:18:10.893137	 1/2 (x − 2) + 1/3 (x − 3) + 1/4 (x − 4) = 10\r\n 6/12 (x − 2) + 4/12 (x − 3) + 3/12 (x − 4) = 10\r\n 6(x − 2) + 4(x − 3) + 3(x − 4) = 120\r\n6x - 12 + 4x - 12 + 3x - 12 = 120\r\n13x - 36 = 120\r\n13x = 156\r\nx = 12\r\n\r\ncheck: 1/2(10) + 1/3(9) + 1/4(8) = 5 + 3 + 2 = 10	\N	\N	12	Matt V.	Julia, Simon	1
318	9	33	Draw a line through the origin with a slope of 0.4. Draw a line through the point (1, 2) with a slope of 0.4. How are these two lines related? What is the vertical distance between the two lines? Find an equation for each line.		2014-07-29 20:33:33.733742	2014-10-23 14:24:08.146886	Graph attached. The two lines are parallel, The vertical distance between the two lines is 1.6.\r\n\r\ny = 4x/10\r\ny = 4x/10 + 1.6	\N	PBL_ans_33_9.PNG	parallel, 1.6, y = 4x/10, y = 4x/10 + 1.6	Jaden	Sam	1
321	1	34	Solve 3m/4 + 3/8 = m/3 − 5/6 for m, expressing your answer as a fraction in lowest terms.		2014-07-29 20:52:51.49007	2014-10-24 15:20:11.136163	3m/4 + 3/8 = m/3 − 5/6\r\n18m/24 + 9/24 = 8m/24 - 20/24\r\n10m/24 = -29/24\r\n10m = -29\r\nm = -29/10\r\n\r\ncheck: -87/10/4 + 3/8 = -29/10/3 - 5/6\r\n-522/10 + 9 = -232/10 - 20\r\n-290/10 = -29\r\n29 = 29	\N	\N	-29/10	Lucia	Liam	1
339	6	35	By rearranging the two parts of the diagram shown at right, you can demonstrate that x2 − 4 is equivalent to (x + 2)(x − 2) without using the distributive property. Show how to do it.		2014-07-31 16:35:47.54415	2014-10-29 13:58:01.059598	  XXXXXXX   Take the small rectangle to the right, which is 2 wide, rotate it 90 degrees and put it on the top.\r\n2 X     X   Now the vertical column is x - 2 and the horizontal pieces are x + 2.\r\n  X-----X\r\n  X     X\r\n  X.....X\r\nx X     X\r\n  X     X\r\n  X     X\r\n  XXXXXXX\r\n    x-2 	PBL_graph_35_6.PNG	\N	Rotate small rectangle and move onto left side.	Lucia	Matt, Henry	1
343	10	35	(Continuation) Graph the equation y = 10 − |x − 10|. Explain its significance to the story.		2014-08-01 00:14:08.532294	2014-10-29 14:11:18.11208	At no point are you more than 10 miles from a gas station. If you are closer to Buzzardtown your distance is 10 + x - 10 or just x. But if you are closer to Dry Gulch, your distance is 20 - x, which is the same as 10 -x + 10. The absolute value function captures this relationship.	\N	PBL_ans_35_10.PNG	--		Caroline	1
336	3	35	Asked to solve the inequality 3 < |x−5| at the board, Corey wrote “8 < x < 2,” Sasha wrote “x < 2 or 8 < x,” and Avery wrote “x < 2 and 8 < x.” What do you think of these answers? Do any of them agree with your answer?		2014-07-29 23:07:56.868328	2014-10-27 16:23:10.249382	3 < |x−5|   ->   3 < x - 5    -3 > x - 5    so x > 8 or x < 2\r\nCorey's answer isn't correct as it includes 5, 3 is not less than 0\r\nSasha's answer is correct as x must either be less than 2 or greater than 8.\r\nAvery's answer isn't correct as a number can't be both less than 2 and greater than 8 at the same time.	\N	\N	agree with x < 2 or 8 < x	Scott	Benji	1
340	7	35	Compare the graphs of y = x − 3 and y = |x − 3|. How are they related?		2014-07-31 23:53:53.640979	2014-10-29 14:00:55.055431	On the positive side of the y intercept the two graphs are the same. On the negative side the second equation has the same slope only negative.	\N	\N	--	Avery	Ben, Julia	1
345	12	35	A train is leaving in 11 minutes and you are one mile from the station. Assuming you can walk at 4 mph and run at 8 mph, how much time can you afford to walk before you must begin to run in order to catch the train?		2014-08-01 01:06:41.122072	2014-10-29 14:50:46.681782	Let t be the amount of time in minutes you can walk and arrive in exactly 11 minutes.\r\n4t + 8(11-t) = 60   (convert 1 mile to 60 since times are in minutes and speeds in mph, i.e. rates 4/60 and 8/60 before you multiply through )\r\n-4t + 88 = 60\r\n-4t = -28\r\nt = 7 minutes\r\n\r\nCheck: 7*4/60 + 4 * 8/60 = .467   + .533 = 1 mile	\N	\N	7 minutes	Lucia		1
333	13	34	Apply the distributive property to write without parentheses and collect like terms: \r\n(a) x(x − 3) + 2(x − 3) (b) 2x(x − 4) − 3(x − 4) (c) x(x − 2) + 2(x − 2)		2014-07-29 22:49:03.184797	2014-10-27 16:18:38.90724	(a) x(x − 3) + 2(x − 3)   ->   x^2 - 3x + 2x - 6    ->   x^2 - x - 6\r\n(b) 2x(x − 4) − 3(x − 4)  ->   2x^2 - 8x - 3x + 12  ->   2x^2 - 11x + 12\r\n(c) x(x − 2) + 2(x − 2)   ->   x^2 - 2x + 2x - 4    ->   x^2 - 4	\N	\N	a) x^2 - x - 6   b) 2x^2 - 11x + 12  c) x^2 - 4	Jaden	Liam	1
337	4	35	Apply the distributive property to write without parentheses and collect like terms:\r\n(a) (x + 2)(x − 3) (b) (2x − 3)(x − 4) (c) (x + 2)(x − 2)		2014-07-30 18:01:29.744141	2014-10-27 16:25:59.642222	(a) (x + 2)(x − 3)   -> x^2 - x - 6\r\n(b) (2x − 3)(x − 4)  -> 2x^2 -11x + 12\r\n(c) (x + 2)(x − 2)   -> x^2 - 4	\N	\N	a) x² - x - 6  b) 2x² -11x + 12  c) x² - 4	Garrett	Henry, Matthew L. 	1
338	5	35	If the width and length of a rectangle are both increased by 10%, by what percent does the area of the rectangle increase? By what percent does the perimeter of the rectangle increase?		2014-07-31 16:17:06.60001	2014-10-29 13:48:10.415002	The area increases by 21%, 1.0x*1.0x becomes 1.1x*1.1x, or 1.21x instead of 1.00x.\r\nThe perimeter increases by 10%, since if it was 1.0x on a side perimeter would be 4.0x, 1.1x on a side would be 4.4x	\N	\N	area 21%, perimeter 10%	Scott	Shantanu, Liam	1
335	2	35	(Continuation) Solve the inequality 30 ≤ 32 − 0.2|r − 55|, and express the solution interval graphically. What is the meaning of these r-values to Kit?		2014-07-29 23:02:41.660924	2014-10-27 16:22:08.827253	30 ≤ 32 − 0.2|r − 55|\r\n-2 ≤ -0.2|r − 55|\r\n0.2|r − 55| ≤ 2\r\n|r − 55| ≤ 10\r\n-10 ≤ r - 55   or   r - 55 ≤ 10 \r\n45 ≤ r ≤ 65\r\n\r\nThe car achieves an r value greater than 30 (30 mpg) when it travels between 45 and 65 mph.\r\n	\N	PBL_ans_35_2.PNG	45 ≤ r ≤ 65, speeds where the car gets at least 30 mpg	Scott	Simon	1
331	11	34	A chemist would like to dilute a 90-cc solution that is 5% acid to one that is 3% acid. How much water must be added to accomplish this task?		2014-07-29 22:36:05.195262	2014-10-27 16:13:26.470805	5*90 = 3s\r\n450 = 3s\r\ns = 150\r\n150-90 or 60 cc's must be added\r\n\r\ncheck: the original solution has .05*90 or 4.5 cc of acid in it. That won't change, so 4.5/150 = .03 or 3%\r\n	\N	\N	60 cc	Lucia	Caroline, Julie	1
341	8	35	Morgan’s way to solve the equation |2x−7| = 5 is to first write |x−3.5| = 2.5. Explain this approach, then finish the job.		2014-07-31 23:57:14.447378	2014-10-29 14:04:16.820344	Morgan divides both sides by 2 so that the equation can be solved for just x.\r\n|x−3.5| = 2.5\r\nx - 3.5 = 2.5 or x−3.5 = -2.5\r\nx = 6 or x = 1\r\n\r\ncheck: 2*6 - 7 = 12 - 7 = 5\r\n       2*1 - 7 = 2 - 7 = -5	\N	\N	divide both sides by 2, 1 or 6	Matt V.	Simon, Julia	1
378	2	39	What is the slope of the line graphed at the right, if (a) the distance between the x-tick marks is 2 units and the distance between the y-tick marks is 1 unit?\r\n(b) the distance between the x-tick marks is 100 units and the distance between the y-tick marks is 5 units?	In a x is doubled vs. y, in b x is 20 times y, thus the relationship.	2014-08-02 21:38:30.689558	2015-02-01 23:47:14.377768	a) -5/16\r\nb) -25/800 or -1/32	PBL_graph_39_2.PNG	\N	a) -5/16    b)  -1/32	Miranda	Sam	1
342	9	35	A 20-mile road runs between Buzzardtown and Dry Gulch. Each town has a gas station, but there are no gas stations between the towns. Let x be the distance from Buzzardtown, measured along the road (so 0 ≤ x ≤ 20), and y be the distance to the nearest gas station. Make a table of values that includes entries for x = 7, x = 9, and x = 16, and then draw a graph of y versus x. The graph should have a vertex at (10, 10).		2014-08-01 00:07:15.872341	2014-10-24 16:14:56.584806	-\r\nx   0   7   9  16  20\r\ny   0   7   9   4   0\r\n\r\n	\N	PBL_ans_35_9.PNG	--	Suzana		\N
359	5	37	The figure shows the graphs of two lines. Use the graphs (the axis markings are one unit apart) to estimate the coordinates of the point that belongs to both lines.		2014-08-01 21:50:08.464238	2014-11-12 16:13:58.392255	2.1, 1.4	PBL_ans_37_5.PNG	\N	about 2, 2.1 and 1.4, 1.5		Simon, Jared	1
348	3	36	To mail a first-class letter in 2006, the rate was 39 cents for the first ounce or fraction thereof, and 24 cents for each additional ounce or fraction thereof. Let p be the number of cents needed to mail a first-class letter that weighed w ounces. Graph p versus w, after first making a table that includes some non-integer values for w.		2014-08-01 01:34:16.494442	2014-11-05 16:50:17.636922	p = .24*(w-1) + .39\r\np = .24w -.24 + .39\r\np = .24w + .15\r\n\r\nw    1    2    3   3.5    4\r\np  .39  .63  .87  1.05 1.05	\N	PBL_ans_36_3.PNG	graph	Matt V., Maya	Ben	1
357	3	37	(Continuation) Put a dot on every lattice point (x, y) that signifies that Lee has at most one dollar in pocket change. How many such dots are there? What is the relationship between Lee’s change situation and the inequality 0.25x + 0.10y ≤ 1.00?		2014-08-01 03:25:57.778946	2014-11-12 16:03:51.597624	1 q, 0 dimes through 1 q 7 dimes, 2 q, 0 through 5 dimes, etc.\r\nI count 29 dots. \r\nAll the dots are below the line that would be formed by connecting the original lattice points that came out equal to one dollar.	\N	PBL_ans_37_3.PNG	29 dots on or below line	Matt K.	Benji, Liam	1
355	1	37	The edges of a solid cube are 3p cm long. At one corner of the cube, a small cube is cut away. All its edges are p cm long. In terms of p, what is the total surface area of the remaining solid? What is the volume of the remaining solid? Make a sketch.		2014-08-01 02:53:26.937363	2014-11-12 15:52:23.965762	Surface area = 6(9p^2) = 54p^2  It is the same as the full cube because even though 3 faces were removed, 3 new faces were uncovered.\r\nVolume = 27p^3 - p^3, It is the full volume minus the volume of the removed cube.	\N	PBL_ans_37_1.PNG	54p^2, 26p^3	Suzana	Sam	1
353	8	36	Hearing Yuri say “This line has no slope,” Tyler responds “Well, ‘no slope’ actually means slope 0.” What are they talking about? Do you agree with either of them?		2014-08-01 02:44:52.926053	2014-10-28 16:25:52.931942	If they are talking about a horizontal line. I would be more accurate to say the slope is 0, since the change in y for a given x is 0. If they are talking about a vertical line, it is fair to say there is no slope, as finding a slope would require dividing by zero.	\N	\N	no, horizontal line slope = 0, vertical undefined	Avery		1
356	2	37	Lee’s pocket change consists of x quarters and y dimes. Put a dot on every lattice point (x; y) that signifies that Lee has exactly one dollar of pocket change. What equation describes the line that passes through these points? Notice that it does not make sense to connect the dots in this context, because x and y are discrete variables, whose values are limited to integers.		2014-08-01 03:12:53.785287	2014-11-12 15:56:53.237278	10y + 25x = 100	\N	PBL_ans_37_2.PNG	10y + 25x = 100 or .1y + .25x = 1	Scott	Henry, , Nicole, Shantanu	1
360	6	37	(Continuation) The 'system of equations' that has been graphed is\r\n{ 9x − 2y = 16\r\n  3x + 2y = 9\r\nJess took one look at these equations and knew right away what to do. “Just add the equations and you will find out quickly what x is.” Follow this advice, and explain why it works.		2014-08-01 21:52:29.003254	2014-11-12 16:14:18.613301	  9x − 2y = 16\r\n  3x + 2y = 9\r\n 12x - 0y = 25\r\n   x = 25/12\r\n\r\nIt works because when the two are added the y variable goes away, making it easy to solve for x.	\N	\N	25/12, eliminate y variable by adding	Scott	Julia, Hannah	1
379	3	39	My sleeping bag is advertised to be suitable for temperatures T between 20 degrees below zero and 20 degrees above zero (Celsius). Write an absolute-value inequality that describes these temperatures T.		2014-08-02 21:39:36.676228	2014-11-17 15:04:28.749896	|T| ≤ 20, is equivalent to:  -20 <= T <= 20	\N	\N	|T| ≤ 20	Matt K., Zach	Hannah	1
349	4	36	Given the line y = 1/2x + 6, write an equation for the line through the origin that has the same slope. Write an equation for the line through (2,−4) that has the same slope.		2014-08-01 01:39:31.323488	2014-11-05 17:02:14.465817	y = 1/2x\r\ny = 1/2x - 5\r\n	\N	PBL_ans_36_4.PNG	y = 1/2(x),  y = 1/2(x-2)-4	Matt V, Maya	Caroline	1
352	7	36	For each of these absolute-value equations, write two equations without absolute-value symbols that are equivalent to the original. Solve each of the equations.\r\n(a) 2|x + 7| = 12 (b) 3 + |2x + 5| = 17 (c) 6 − |x + 2| = 3 (d) −2|4 − 3x| = −14		2014-08-01 02:42:47.179678	2014-11-11 15:18:32.936713	(a) 2|x + 7| = 12 \r\nx + 7 = 6  or  x + 7 = -6   ->  -1, -13\r\n(b) 3 + |2x + 5| = 17 \r\n2x + 5 = 14  or 2x + 5 = -14   ->   4.5, -9.5\r\n(c) 6 − |x + 2| = 3 \r\nx + 2 = -3 or  x + 2 = 3   ->  -5, 1\r\n(d) −2|4 − 3x| = −14\r\n4 - 3x = 7  or  4 - 3x = -7    ->  -1, 11/3	\N	\N	a) -1, -13  b)  4.5, -9.5  c) -5, 1  d) -1, 11/3	Miranda	Hannah, Liam	1
351	6	36	Which of the following calculator screens could represent the graph of 9x + 5y = 40?		2014-08-01 02:35:29.055104	2014-11-11 15:07:44.410863	The x intercept is 8 and the y intercept is 4.44, so it can't be a or c. In b the y intercept is smaller than the x intercept, while in d the y intercept is about twice the x intercept, but the graph could be scaled differently. Thus b or d is the answer.\r\n	PBL_graph_36_6.PNG	\N	b or d 	Matt K.	Ben, Jared	1
354	9	36	A flat, rectangular board is built by gluing together a number of square pieces of the same size. The board is m squares wide and n squares long. In terms of m and n, write two different expressions for the number of completely surrounded squares.		2014-08-01 02:47:14.140672	2014-11-11 15:21:38.901923	(m-2)(n-2)\r\n(m*n)-2m-2n+4	\N	\N	(m-2)(n-2) or (m*n)-2m-2n+4	Lucia	Henry, Shantanu, Matt	1
358	4	37	(Continuation) Write two inequalities that stipulate that Lee cannot have fewer than zero quarters or fewer than zero dimes.		2014-08-01 03:27:00.988583	2014-11-12 16:08:32.079806	q >= 0\r\nd >= 0	\N	\N	x >= 0, y >= 0	Jaden	Tori	1
347	2	36	For each of the following points, find the distance to the y-axis:\r\n(a) (11, 7) (b) (−5, 9) (c) (4, y) (d) (x,−8)		2014-08-01 01:12:44.109728	2014-11-05 16:49:18.583412	a) 11\r\nb) 5\r\nc) 4\r\nd) |x|	\N	\N	a) 11  b) 5  c) 4  d) |x|	Garrett	Henry, Shantanu	1
374	9	38	Brett is holding three quarters and five dimes. Does Brett have more than one dollar or less than one dollar? Does the point (3, 5) lie above or below the line 0.25x+0.10y = 1.00?		2014-08-02 00:30:01.926121	2014-11-13 17:21:19.478702	More than one dollar, since he has 1.25.\r\nAbove the line.\r\n	\N	PBL_ans_38_9.PNG	More than a dollar, above the line	Jaden	Nicole, Shantanu, Henry, Matt	1
373	8	38	(Continuation) If you add the two given equations, you obtain the equation of yet another line. Add its graph to the figure. You should notice something. Was it expected?		2014-08-02 00:26:52.270016	2014-11-13 17:20:28.771081	3x + 2y = 6\r\n3x − 4y = 17\r\n6x - 2y = 23\r\n-2y = -6x + 23\r\ny = 3x - 23/2\r\nThis line passes through the same simultaneous solution as the first two.\r\n	\N	PBL_ans_38_8.PNG	All 3 intersect at the same point	Suzana	Ben	1
370	6	38	The figure at right shows the graphs of two lines. First use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{3x + 2y = 6\r\n 3x − 4y = 17\r\nRandy took one look at these equations and knew right away what to do. “Just subtract the equations and you will find out quickly what y is.” Follow this advice.		2014-08-02 00:06:58.151043	2014-11-13 17:12:36.704335	Estimate: (3.2, -1.9)\r\n  3x + 2y = 6\r\n- 3x − 4y = 17\r\n  0x + 6y = -11\r\ny = -11/6, or -1.8333\r\n\r\n\r\n	PBL_graph_38_6.PNG	\N	-11/6 or -1.8333->	Matt K.	Tori	1
375	10	38	Find the value of x that fits the equation (1/2)x + (1/3)x + (1/4)x = 26.		2014-08-02 00:34:25.779723	2014-11-13 17:22:50.929893	(1/2)x + (1/3)x + (1/4)x = 26\r\n6x/12 + 4x/12 + 3x/12 = 26\r\n13x = 26+12\r\n13x = 312\r\nx = 24\r\n\r\ncheck: 12 + 8 + 6 = 26	\N	\N	24	Suzana	Liam	1
362	8	37	Using four x-blocks:\r\n(a) Draw a rectangle. Write the dimensions of your rectangle. What is its area?\r\n(b) Draw a rectangle with dimensions different from those you used in part (a).		2014-08-01 22:07:12.353566	2014-10-29 18:10:26.749427	a)  XXXXXXXX|XXXXXXXX  Dimensions, 2x by 2x. Area 4x^2\r\n    X       |       X\r\n  x X       |       X\r\n    X       |       X\r\n    X-------|-------X\r\n    X       |       X\r\n  x X       |       X\r\n    X       |       X\r\n    XXXXXXXXXXXXXXXXX\r\n        x       x\r\nb)  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  Dimensions, x by 4x. Area 4x^2\r\n    X       |       |       |       X\r\n  x X       |       |       |       X\r\n    X       |       |       |       X\r\n    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\r\n        x       x       x       x\r\n	\N	\N	2 by 2 or 4 by 1	Jaden		1
363	9	37	In 1990 a company had a profit of $420000. In 1995 it reported a profit of $1400000.\r\nFind the average rate of change of its profit for that period, expressed in dollars per year.		2014-08-01 22:10:41.156153	2014-10-29 18:11:23.05526	(1,400,000/420,000)/(1995-1990)\r\n  980000/5\r\n $196,000 average increase per year\r\n	\N	\N	$196,000 average increase per year	Lucia		1
372	7	38	(Continuation) Find the missing x-value by inserting the y-value you found into one of the two original equations.\r\nDoes it matter which one? Compare the intersection coordinates with your estimate.		2014-08-02 00:10:09.577697	2014-11-13 17:14:50.597209	3x - 22/6 = 6\r\n18x - 22 = 36\r\n18x = 58\r\nx = 58/18=29/9 or 3.222\r\nIt doesn't really matter which one you choose, although sometimes it's easier to substitute into one than the other.\r\nThe intersection coordinates were close to my estimates. Estimate: (3.2, -1.9), Actual (3.2222,-1.8333(\r\ncheck: 87/9 - 22/6 = 6   ->  174/18 - 66/18 = 108/18 = 6	\N	\N	29/9 or 3.222	Jason	Hannah, Liam, Tori	1
366	2	38	Draw a rectangle using two x2-blocks and two x-blocks. Write the dimensions of your rectangle. What is the area of the rectangle?		2014-08-01 23:30:14.580688	2014-11-06 16:52:01.781976	-\r\n    XXXXXXXX|XXXXXXXXXXXX Dimensions, x by 2x+2. Area 2x^2+2x\r\n    X       |       | | X\r\n  x X       |       | | X\r\n    X       |       | | X\r\n    XXXXXXXX|XXXXXXXXXXXX\r\n        x       x    1 1\r\n	\N	\N	2x^2+2x	Lucia		1
367	3	38	(Continuation) Using the same two x2-blocks and same two x-blocks, draw a different rectangle. What is the area of the rectangle?		2014-08-01 23:38:05.111476	2014-11-06 16:52:59.49576	- Dimensions, 2x by x+1. Area 2x^2+2x\r\n    XXXXXXXX|XX\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    X-------| X\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    XXXXXXXX|XX\r\n        x    1\r\n	\N	\N	2x^2+2x	Suzana		1
364	10	37	Most linear equations can be rewritten in slope-intercept form y = mx + b. Give an example that shows that not all linear equations can be so rewritten.		2014-08-01 22:13:40.793176	2014-10-29 18:26:54.728353	ax + by = c\r\nby = -ax + c\r\ny = -ax/b + c/b\r\n\r\nCan't be done if b is zero, since dividing by zero is undefined.	\N	\N	x = 0	Maya		1
376	11	38	A hot-air balloon ride has been set up so that a paying customer is carried straight up at 50 feet per minute for ten minutes and then immediately brought back to the ground at the same rate. The whole ride lasts twenty minutes. Let h be the height of the balloon (in feet) and t be the number of minutes since the ride began. Draw a graph of h versus t. What are the coordinates of the vertex? Find an equation that expresses h in terms of t.		2014-08-02 00:49:37.421091	2014-11-13 17:23:33.74365	The coordinates of the vertex are (10,500)\r\nThe equation is h = 500-|(t*50)-500|\r\n	\N	PBL_ans_38_10.PNG	h = 500 - 50 |10- t|	Lucia	Caroline	1
377	1	39	Fitness Universe has a membership fee of $50, after which individual visits to the gym are $5.50. Non-members pay $8.00 per visit. Stuart is going to exercise at the gym regularly, and is wondering whether it makes sense to become a member. How regularly would Stuart need to visit this gym, in order for a membership to be worth it?		2014-08-02 00:55:39.522721	2014-11-17 14:46:03.571391	5.5v + 50 < 8v\r\n50 < 2.5v\r\nv > 20\r\nHe would have to go more than 20 times during the membership period to make the membership a better deal.\r\ncheck: 5.5*20 + 50 = 160, 5.5*21 + 50 = 165.50\r\n8*20 = 160, 8*21 = 168	\N	\N	More than 20 visits	Jason	Henry Nicole, Shantanu, Hannah	1
369	5	38	Find values for x and y that fit both of the equations 2x − 3y = 8 and 4x + 3y = −2.		2014-08-01 23:45:12.885688	2014-11-13 17:13:42.873245	  2x − 3y = 8\r\n+ 4x + 3y = −2\r\n  6x      = 6\r\nx = 1\r\n3y = -4 - 2\r\n3y = -6\r\ny = -2\r\ncheck:  2 - -6 = 8,  4 + -6 = -2\r\n	\N	\N	1, -2		Henry, Shantnu, Nicole, Matt	1
361	7	37	(Continuation) Find the missing y-value by inserting the x-value you found into either of the two original equations. Do the coordinates of the intersection point agree with your estimate? These coordinates are called a 'simultaneous solution' of the original system of equations. Explain the terminology.		2014-08-01 21:57:41.843282	2014-11-12 16:16:03.51493	x = 25/12 or 2.08333, close to my estimate of 2.1\r\n3*25/12 + 2y = 9\r\n75/12 + 2y = 9\r\n75 + 24y = 108\r\n24y = 33\r\ny = 33/24 or 1.375, close to my estimate of 1.4\r\nThis is called a simultaneous solution to both equations because this pair is true for both.\r\n	\N	\N	11/8	Matt V	Caroline	1
382	7	39	Find values for x and y that fit both of the equations 5x + 3y = 8 and 4x + 3y = −2.		2014-08-02 22:17:46.740962	2014-11-17 15:14:33.241732	  5x + 3y =  8\r\n- 4x + 3y = −2   (subtract equations to get only x\r\n   x = 10\r\n  50 + 3y = 8\r\n  3y = -42\r\n   y = -42/3\r\n   y = -14\r\ncheck: 50 - 42 = 8\r\n	\N	\N	(10, -14)	Maya	Nicole	1
387	11	39	Graph y = 3|x−2|−6, and find coordinates for the vertex and the x- and y-intercepts.		2014-08-02 22:56:45.744447	2014-11-17 15:23:12.386448	Vertex = (2, -6)\r\nx intercepts = 0, 4\r\ny intercept =  0	\N	PBL_ans_39_11.PNG	V=(2,-6), x-ints:0,4, y-int:0	Matt K.	Ben	1
385	9	39	Casey can peel k apples in 10 minutes.\r\n(a) In terms of k, how many apples can Casey peel in one minute?\r\n(b) How many apples can Casey peel in m minutes?\r\n(c) In terms of k, how many minutes does it take Casey to peel one apple?\r\n(d) How many minutes does it take Casey to peel p apples?		2014-08-02 22:32:47.26579	2014-11-17 15:19:52.441349	a)k/10\r\nb)k/(10/m) or mk/10\r\nc)10/k\r\nd)10/(k/p) or 10p/k	\N	\N	a) k/10  b) mk/10  c) 10/k   d)  10p/k	Jaden	Caroline	1
391	4	40	Sandy’s first four test scores this term are 73, 87, 81 and 76. To have at least a B test grade, Sandy needs to average at least 80 on the five term tests (which count equally). Let t represents Sandy’s score on the fifth test, and write an inequality that describes the range of t-values that will meet Sandy’s goal.		2014-08-02 23:30:53.610315	2014-11-19 15:05:03.248023	73+87+81+76+t >= 400\r\nt >= 400-317\r\n83 <= t <= 100	\N	\N	83 <= t <= 100	Scott	Caroline, Hannah	\N
381	5	39	Graph the equation 2x+3y = 6. Now graph the inequality 2x+3y ≤ 6 by shading all points (x, y) that fit it. Notice that this means shading all the points on one side of the line you drew. Which side? Use a test point like (0, 0) to decide.		2014-08-02 22:11:25.759796	2014-11-17 15:10:28.986115	2x+3y = 6\r\ny = -2x/3 + 2\r\nTesting for 0,0 is less than 6, so the points go below the line.	\N	PBL_ans_39_5.PNG	below the line	Miranda	Simon, Jared	1
384	8	39	A 100-liter barrel of vinegar is 8% acetic acid. Before it can be bottled and used in cooking, the acidity must be reduced to 5% by diluting it with pure water. In order to produce 64 liters of usable vinegar, how many liters of vinegar from the barrel and how many liters of pure water should be combined?		2014-08-02 22:32:18.042756	2014-11-17 15:16:23.330742	64 * .05 = 3.2 liters of vinegar are needed in the 64 liter batch.\r\n3.2/.08 = 40, so it takes 40 liters from the 100 liter barrel.\r\nthe total has to be 64, so 24 liters of pure water need to be added.\r\n\r\ncheck: 3.2/64 = .05, 3.2/.08 = 40	\N	\N	40 from the barrel, 24 pure water	Jaden, Maya	Matthew L.	1
396	1	41	Raisins make up two thirds of a well-mixed bowl of peanuts and raisins. If half the mixture is removed and replaced with peanuts, what fraction of the bowl will be raisins?		2014-08-03 00:49:29.864302	2014-11-20 15:49:51.148995	r = 4/6  p = 2/6\r\n1/2 bowl is thus 2/6r and 1/6 p\r\nAdd 3/6p\r\nFinal mix is now 1/3r and 2/3p	\N	\N	1/3 raisins	Maya, Jaden	Henry	1
390	3	40	The diagram consists of two x2-blocks, five x-blocks and three 1-blocks. Use this diagram to write a statement that says that the product of the length and width of this particular rectangle is the same as its area. Can you draw another rectangle with the same area but different dimensions?		2014-08-02 23:25:10.589729	2014-11-19 14:53:20.805698	(x + 1)(2x + 3) = 2x^2 + 5x + 3\r\nI don't think there is another rectangle, since the x^2 blocks have to be next to each other and can't otherwise be matched up with the 1 blocks.\r\n	\N	\N	No, can't be done	Jaden	Tori, Sam	1
386	10	39	Express each as a single fraction: \r\n(a) 1/a + 2/b + 3/c\r\n(b) 1/a + 1/(b + c)\r\n(c) 1 + 2/(a + b)		2014-08-02 22:53:06.085524	2014-11-17 15:25:28.550933	(a 1/a + 2/b + 3/c\r\n   bc/abc + 2ac/abc + 3ab/abc\r\n   (bc + 2ac + 3ab)/abc\r\n(b 1/a + 1/(b + c)\r\n   (b+c)/(ab+ac) + a/(ab+ac)\r\n   (a+b+c)/(ab+ac)\r\nc) 1 + 2/(a + b)\r\n  (a+b)/(a+b) + 2/(a+b)\r\n  (a+b+2)/(a+b)	\N	\N	a) (bc + 2ac + 3ab)/abc  b) (a+b+c)/(a(b+c))   c)  (a+b+2)/(a+b)	Avery	Liam	1
393	6	40	Shade the points in the plane whose x-coordinates are greater than their y-coordinates.\r\nWrite an inequality that describes these points.		2014-08-03 00:10:24.824245	2014-11-19 15:14:39.222395	y < x	\N	PBL_ans_40_6.PNG	y < x	Matt V, Maya, Jaden	Sam	1
383	6	39	Some questions about the line that passes through the points (−3,−2) and (5, 6):\r\n(a) Find the slope of the line.\r\n(b) Is the point (10, 12) on the line? Justify your answer.\r\n(c) Find y so that the point (7, y) is on the line.		2014-08-02 22:22:52.949727	2014-11-17 15:11:10.609269	a) slope is (6 - -2)/5 - -3) -> 8/8 or 1\r\nb) no, since the slope is one if the rise is 1 the run must be 1, thus the point on the line would be (10,11)\r\nc) (7,8), y will always be one greater than x.\r\nequation of line:  y = x + 1	\N	\N	a) 1  b) no   c) 8	Zach	Julia	1
395	8	40	Solve the system of equations 2x + y = 5 and 5x−2y = 8 algebraically. Check your answer graphically.		2014-08-03 00:45:38.164243	2014-11-19 15:15:51.100381	   2x +  y = 5 \r\n   5x − 2y = 8\r\n\r\n   4x + 2y = 10 \r\n   5x − 2y = 8\r\n+  9x      = 18\r\nx = 2\r\n4 + y = 5\r\ny = 1\r\ncheck: 4+1 = 5, 10-2 = 8	\N	PBL_ans_40_8.PNG	(2,1)	Matt V	Benji	1
389	2	40	(Continuation) Lee’s plan has now created a familiar situation. Do you recognize it? Complete the solution to the system of equations. Do the coordinates of the point of intersection agree with your initial estimate?		2014-08-02 23:15:03.9624	2014-11-12 16:54:58.480955	{ 4x + 3y = 20\r\n  3x − 2y = −5\r\n\r\n  8x + 6y =  40\r\n+ 9x - 6y = -15\r\n 17x + 0y = 25\r\nx = 25/17 or ~1.47\r\n3y + 100/17 = 20\r\n3y = 340/17 - 100/17\r\n3y = 240/17\r\ny = 80/17 or ~4.71\r\nThe results above are very close to the estimates.\r\ncheck: 100/17 + 240/17 = 340/17 = 20\r\n75/17 - 160/17 = -85/17 = -5\r\n	\N	\N	(1.47, 4.71)	Maya		1
394	7	40	The diagram at right shows a rectangle that has been cut into nine square pieces, no two being the same size. Given that the smallest piece is 2 cm by 2 cm, figure out the sizes of the other eight pieces. A good strategy is to start by guessing the size of one of the pieces adjacent to the smallest piece. By checking your guess, you will discover the hidden equation.		2014-08-03 00:26:22.50141	2014-11-19 15:19:37.607848	Picture attached\r\n\r\n\r\n	\N	PBL_ans_40_7.PNG	The second box is 5		Hannah, Jared, Matt	\N
407	2	42	(Continuation) Instead of saying, “Find the dimensions of a rectangle made with two x2-blocks, three x-blocks and one 1-block”, mathematicians say “Factor 2x^2 + 3x + 1.” It is also customary to write the answer 2x^2 + 3x + 1 = (2x + 1)(x + 1). Explain why the statement about the blocks is the same as the algebraic equation.		2014-08-04 01:30:58.624582	2014-11-21 17:27:53.280007	The two terms are like the length and width of a rectangle. Multiplying them gives the area. So if you count up the numbers of the various types of objects formed when you make a rectangle out of algebra blocks, you have effectively multiplied the two terms. Since you know the two expressions are equivalent, you can go the other way too, i.e., start with the area and get back the two sides, i.e. factoring the equation.	\N	\N	--		Juila	1
399	4	41	Jess and Wes used to race each other when they were younger. Jess could cover 8 meters per second, but Wes could cover only 5 meters per second, so Jess would sportingly let Wes start 60 meters ahead. They would both start at the same time and continue running until Jess caught up with Wes. How far did Jess run in those races?		2014-08-03 17:47:54.374707	2014-11-20 16:12:39.220541	8t = 5t + 60\r\n3t = 60\r\nt = 20 seconds\r\nJess would run 160 meters.\r\n\r\ncheck: 5*20 + 60 = 160	\N	\N	160 m	Scott	Sam, Julia, Liam	1
402	7	41	Farmer MacGregor wants to know how many cows and ducks are in the meadow. After counting 56 legs and 17 heads, the farmer knows. How many cows and ducks are there?		2014-08-03 20:58:00.13665	2014-11-20 16:22:10.96524	There are 17 animals, some with 2 legs and some with four.\r\nSo 2c + 4d = 56\r\nc + d = 17, so c = 17 - d, we can substitute 17-c for d.\r\n2(17-c) + 4c = 56\r\n34-2c+4c = 56\r\n2c = 22\r\n11 cows and 6 ducks\r\nchecks:  11*4 + 6*2 = 56	\N	\N	11 cows and 6 ducks	Matt V.	Nicole, Shantanu, Henry	1
405	8	41	What are the x- and y-intercepts of y = |x − h| + k, and what are the coordinates of its vertex?		2014-08-03 21:25:22.955775	2014-11-20 16:37:11.047701	y = |x − h| + k\r\nx intercept -> 0 = |x − h| + k -> -k = |x-h|  ->  -k = x-h and k = x-h  ->   x = -k-h and x = -k+h, though this only occurs if k is less than zero.\r\ny intercept -> y = |-h| + k  ->  y = |h| + k\r\nvertex is (h,k)	\N	\N	x int: h+k or h-k if k<0,  y int:|h|+k,  vertex:(h,k)	Avery	Simon	1
400	5	41	Use a different color for the regions described in parts (a) and (b):\r\n(a) Shade all points whose x- and y-coordinates sum to less than 10.\r\n(b) Shade all points whose x- and y-coordinates are both greater than zero.\r\n(c) Write a system of three inequalities that describe where the two regions overlap.		2014-08-03 18:00:46.716051	2014-11-20 16:15:39.872549	a) shaded brown\r\nb) shaded blue\r\nc) shaded purple, y > 0, x > 0, y < 10 - x	\N	PBL_ans_41_5.PNG	X+Y < 10, X>0, Y>0	Jaden	Matt	1
408	3	42	Three gears are connected so that two turns of the first wheel turn the second wheel nine times and three turns of the second wheel turn the third wheel five times. \r\n(a) If you turn the first wheel once, how many times does the third wheel turn?\r\n(b) How many times must you turn the first wheel so that the third wheel turns 30 times?		2014-08-04 01:39:13.796252	2014-11-25 14:49:28.877327	a) (9/2) * 5/3 = 45/6 turns or 7.5 turns\r\nb) If one turn of wheel #1 produces 7.5 turns of wheel #3, then 4 turns of wheel #1 should produce 30 turns of wheel #3\r\n\r\ncheck: 4 turns of wheel one produces 18 turns of wheel 2. 18 turns is 6 groups of 3, so the third wheel will turn 6*5 or 30 times.	\N	\N	a) 7.5 turns   b) 4 turns	Garett	Jared, Nicole, Matt	1
409	4	42	How much money do you have, if you have d dimes and n nickels? Express your answer in (a) cents; (b) dollars.		2014-08-04 01:40:20.630816	2014-11-25 14:52:46.582452	in cents: 10d + 5n\r\nin dollars: .1d + .05n\r\n	\N	\N	a) 10d+5n  b) 0.1d+0.05n	Matt V	Henry. Liam	1
410	5	42	How many nickels have the same combined value as q quarters and d dimes?		2014-08-04 01:42:42.187028	2014-11-25 14:55:37.934753	q*5 + d*2	\N	\N	5q+2d	Lucia	Shantanu, Ben, Julia	1
398	3	41	Find an equation for each of the following lines. When possible, express your answer in both point-slope form and slope-intercept form.\r\n(a) The line passes through (3, 5), and has −1.5 as its slope.\r\n(b) The line is parallel to the line through (−8, 7) and (−3, 1), and has 6 as its x-intercept.\r\n(c) The line is parallel to the line x = −4, and it passes through (4, 7).		2014-08-03 17:45:08.012939	2014-11-20 16:09:49.387369	a) y - 5 =  -1.5(x-3)   y = -1.5x + 9.5\r\nb) slope is (7-1)/(-8- -3) or -6/5, has point (6,0).  y = -6/5(x - 6) or y = -6x/5 + 36/5 \r\nc) x = 4, no slope-intercept form	\N	\N	a)  y = -1.5(x-3)+5  b) y = -6/5(x-6)  c) x = 4	Lucia	Ben	1
406	1	42	Create a rectangle by combining two x2-blocks, three x-blocks and a single 1-block. Write expressions for the length and width of your rectangle. Using these expressions, write a statement that says that the product of the length and width equals the area.		2014-08-03 21:30:44.728505	2014-11-21 17:27:39.543296	- \r\n    XXXXXXXXXXXXXXXXXXX  Length = 2x + 1\r\n    X       |       | X  Width = x + 1\r\n  x X       |       | X  Area = (2x + 1)(x + 1) = 2x^2 + 3x + 1\r\n    X       |       | X\r\n    X-----------------X\r\n  1 X       |       | X\r\n    XXXXXXXXXXXXXXXXXXX\r\n        x       X    1 	\N	\N	L=2x + 1, W=x + 1, A=(2x + 1)(x + 1)	Jaden	Julia	1
411	6	42	Find the point (x, y) that fits both of the equations y = 1.5x + 2 and 9x + 4y = 41.		2014-08-04 02:12:21.16324	2014-11-25 15:04:20.627317	{   y = 1.5x + 2\r\n   9x + 4y = 41\r\n-1.5x + y  = 2\r\n   9x + 4y = 41\r\n  -9x + 6y = 12\r\n       10y = 53\r\n         y = 53/10\r\n  9x + 212/10 = 410/10\r\n  9x = 198/10\r\n   x = 198/90\r\n   x = 99/45\r\n   x = 11/5\r\ncheck: 99/45*3/2+2 = 5.3 or 53/10\r\n	\N	\N	(53/10,11/5) or (5.3,2.2)	Lucia	Caroline, Simon	\N
425	1	44	1. Find an equation for the line that passes through the point (−3, 6), parallel to the line through the points (0, −7) and (4,−15). Write your answer in point-slope form.		2014-08-04 16:41:53.218719	2014-12-03 16:07:46.432325	Slope is -2.\r\nequation is (y - 6) = -2(x + 3) \r\ncheck: y = -2x -6 + 6\r\n       y = -2x\r\n       6 = -2*-3	\N	\N	y = -2((x+3)+6	Avery	Henry, Shantanu	1
423	7	43	On 3 January 2004, after a journey of 300 million miles, the rover Spirit landed on Mars and began sending back information to Earth. It landed only six miles from its target. This accuracy is comparable to shooting an arrow at a target fifty feet away and missing the exact center by what distance?		2014-08-04 16:24:18.838265	2014-12-02 15:23:40.480083	6/300,000,000 = 0.00000002\r\n50 * 0.00000002 = 0.000001 feet\r\n0.000001 feet = 0.00000083 inches\r\nor 1/83333	\N	\N	0.000001 feet or 0.000012 inches	Matt K	Caroline	1
424	8	43	Graph y = 2|x + 1| − 3, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = a|x − h| + k.		2014-08-04 16:29:51.422471	2014-12-02 15:24:31.378284	The vertex is (-1,-3), meaning it is moved on the x axis by -h and on the y by k.\r\nThe slope for the part to the right of the vertex will be a, and to the left of the vertex it will be -a	\N	PBL_ans_43_8.PNG	--	Suzana	Shantanu, Henry	1
415	10	42	Factor each expression and draw an algebra-block diagram:\r\n(a) 3x^2 + 12x (b) x^2 + 5x + 6 (c) 4xy + 2y2		2014-08-04 06:10:15.964899	2014-11-25 15:25:12.598536	(a) 3x^2 + 12x    (3x)(x+4)\r\n(b) x^2 + 5x + 6  (x + 3)(x + 2)\r\n(c) 4xy + 2y2     (2y)(2x + y)\r\n\r\n	\N	PBL_ans_42_10.PNG	a) 3x(x+4)  b) (x+3)(x+2)  c) 2y(2x+y)	Jason, Matt K	Ben	1
416	11	42	Pat and Kim are walking in the same direction along Front Street at a rate of 4 mph. Pat started from the Library at 8 am, and Kim left from the same spot 15 minutes later.\r\n(a) Draw a graph that plots Pat’s distance from the Library versus time.\r\n(b) On the same coordinate-axis system, draw a graph that plots Kim’s distance from the Library versus time.		2014-08-04 06:19:19.846885	2014-11-25 16:10:31.14423		\N	PBL_ans_42_11.PNG		Miranda	Henry, Nicole	1
418	2	43	What is unusual about the graphs of the equations 9x−12y = 27 and −3x+4y = −9?		2014-08-04 06:40:11.866285	2014-12-02 14:50:06.704406	  9x−12y = 27\r\n -12y = -9x + 27\r\n    y = 3x/4 - 27/12\r\n    y = 3x/4 - 9/4\r\n\r\n  −3x+4y = −9\r\n   4y = 3x - 9\r\n    y = 3x/4 - 9/4   \r\nThey are equivalent equations, so they have the same graph.	\N	\N	equivalent, have same graph	Suzana	Hannah, Nicole	1
420	4	43	With parental assistance, Corey buys some snowboarding equipment for $500, promising to pay $12 a week from part-time earnings until the 500-dollar debt is retired. How many weeks will it take until the outstanding debt is under $100? Write an inequality that models this situation and then solve it algebraically.		2014-08-04 15:45:09.589757	2014-12-02 15:05:39.446064	500 - 12w < 100\r\n500 < 12w + 100\r\n12w > 400\r\nw > 34\r\n\r\ncheck: in 33 weeks he has paid back $396.	\N	\N	12w + 100 >= 500,   34 weeks	Jaden	Benji, Simon	1
421	5	43	The rails on a railroad are built from thirty-foot sections. When a train wheel passes over the junction between two sections, there is an audible click . Inside a train that is traveling at 70 mph, how many clicks can a passenger hear during a 20-second interval?		2014-08-04 15:51:26.874756	2014-12-02 15:06:05.436456	70 mph = 369600 feet per hour  369600/60 = 6160 feet per minute, 6160/3, 2053.3 feet in each twenty second interval. 2053/30 gives about 68.4 clicks per rail. Since there are two rails the final answer is 136.8 or about 137 clicks in each 20 second interval.	\N	\N	68.4 clicks per rail	Avery	Hannah, Benji, Jarod	1
422	6	43	In attempting to calculate the carrying capacity of a cylindrical pipe, Avery measured the outer diameter to be 2 inches, neglecting to notice that the pipe was one eighth of an inch thick. By what percent did Avery overestimate the carrying capacity of the pipe?		2014-08-04 16:19:17.941415	2014-12-02 15:13:26.754431	The carrying capacity of the pipe is a function of its area. The area of any piece of the pipe is pi*r^2. The outer area is pi*1*1 or about 3.14 square inches. The area of the part that actually carries water is smaller than that, the radius is .875 rather than 1, giving an area of pi*.875*.875 or about 2.41 square inches. 3.14/2/41 = 1.306, so Avery overestimated by about 31%.	\N	\N	30.6%	Miranda	Tori, Sam	1
413	8	42	If the price of a stock goes from $4.25 per share to $6.50 per share, by what percent has the value of the stock increased?		2014-08-04 02:24:27.311997	2014-11-25 15:22:10.954214	6.50-4.25 = 1.529, so about 53%	\N	\N	52.9%	Avery	Julia	1
441	6	45	The population of Exeter is about 15 thousand persons. The population of the United States is about 300 million persons. What percent of the US population lives in Exeter?		2014-08-04 23:45:30.428457	2014-12-08 14:44:44.263753	15/300000 = .00005 or 0.005%, i.e. 5/1000ths of a percent.	\N	\N	0.005%	Matt K	Matt L., Ben. 	1
429	5	44	At the Exeter Candy Shop, Jess bought 5.5 pounds of candy — a mixture of candy priced at $4 per pound and candy priced at $3.50 per pound. Given that the bill came to $20.75, figure out how many pounds of each type of candy Jess bought.		2014-08-04 20:00:43.0117	2014-12-03 16:15:44.922674	4c + 3.5d = 20.75\r\nc + d = 5.5\r\nc = 5.5 - d\r\n4(5.5-d)+3.5d = 20.75\r\n22 - 4d + 3.5d = 20.75\r\n22 - .5d = 20.75\r\n.5d = 1.25\r\nd = 2.5, c = 3\r\ncheck: 2.5*3.5 + 3*4 = 20.75\r\n	\N	\N	3 lbs at $4 and 2.5 lbs at $3.50	Suzana	Benji, Matthew	1
444	9	45	Sketch the region common to the graphs of y ≥ −1, y − 2x ≤ 3, and x + y ≤ 6. Find the area of this region.	Fix diagram	2014-08-08 00:42:30.289138	2014-12-08 16:07:29.856607	Graph attached, area is 18.75 (triangle with base 7.5 and height of 5)	\N	PBL_ans_45_9.PNG	27	Jaden	Sam, Hannah	1
430	6	44	Explain how to evaluate 4^3 without a calculator. The small raised number is called an exponent, and 4^3 is a power of 4 . Write 4 · 4 · 4 · 4 · 4 as a power of 4. Write the product 4^3 · 4^5 as a power of 4.		2014-08-04 20:03:09.369086	2014-12-03 16:17:46.597253	4^3 is 4*4*4 or 16*4 or 64\r\n4^5\r\n4*4*4*4*4*4*4*4	\N	\N	4^5, 4*4*4*4*4*4*4*4	Lucia	Hannah, Julia	1
431	7	44	Does every system of equations px + qy = r and mx + ny = k have a simultaneous solution (x, y)? Explain.		2014-08-04 20:04:40.824846	2014-11-25 19:01:38.935235	Not necessarily. If the lines have the same slope but different intercepts they will be parallel and thus there won't be a point common to both lines.	\N	\N	no	Lucia		1
436	1	45	Wes walks from home to a friend’s house to borrow a bicycle, and then rides the bicycle home along the same route. By walking at 4 mph and riding at 8 mph, Wes takes 45 minutes for the whole trip. Find the distance that Wes walked.		2014-08-04 20:48:59.617512	2014-12-04 17:21:33.060703	w = 2b\r\n3b = 45\r\nb = 15, he rode for 15 minutes and walked for 30.\r\n30/60*4 = 2, 2 miles\r\ncheck: 15/60*8 = 2 miles	\N	\N	2 miles	Scott	Nicole	1
434	10	44	You have one x2-block, six x-blocks (all of which you must use), and a supply of 1-blocks. How many different rectangles can you make? \r\nDraw an algebra block diagram for each.		2014-08-04 20:30:46.080184	2014-11-25 19:10:05.218076	4 rectangle, graph attached	\N	PBL_ans_44_10.PNG	4 rectangles	Maya		1
439	4	45	What values of x satisfy the inequality |x| > 12? Graph this set on a number line, and describe it in words. Answer the same question for |x − 2| > 12.		2014-08-04 20:55:58.426282	2014-12-04 17:23:37.562254	|x| > 12 - x is either more than 12 or less than -12.\r\n====O----|----|----|----|----|----|----|----|----|----|----|----o====\r\n   -12  -10   -8   -6   -4   -2   0    2    4    6    8   10   12\r\n|x − 2| > 12 - x is either more than 14 or less than -10.\r\n====|====o----|----|----|----|----|----|----|----|----|----|----|----o====\r\n   -12  -10   -8   -6   -4   -2   0    2    4    6    8   10   12   14\r\n	\N	\N	x > 12 or x < 12,  x > 14 or x < -10	Suzana	Benji	1
442	7	45	A rectangle is four times as long as it is wide. If its length were diminished by 6 meters and its width were increased by 6 meters, it would be a square. What are its dimensions?	Add diagram	2014-08-07 23:55:50.495747	2014-12-08 14:59:28.597071	l = 4w\r\nl - 6 = w + 6\r\n4w - 6 = w + 6\r\n3w = 12\r\nw = 4\r\nl = 16\r\ncheck: 4+6 = 16-6	\N	\N	4 x 16 meters	Miranda	Liam, Sam, Caroline	1
437	2	45	Given that s varies directly with t, and that s = 4.56 meters when t = 3 seconds, find s when t is 4.2 seconds.		2014-08-04 20:51:46.850716	2014-12-04 17:21:58.562163	4.56/3 = s/4.2\r\n3s = 19.152\r\ns = 6.384 meters	\N	\N	s = 6.384 meters	Matt V.	Julia	1
440	5	45	The figure at the right shows a rectangular box whose dimensions are 8 cm by 10 cm by 12 cm.\r\n(a) Find the volume of the solid.\r\n(b) What is the combined area of the six faces?\r\n(c) If you were to outline the twelve edges of this box with decorative cord, how much would you need?		2014-08-04 23:42:35.156958	2014-12-08 14:45:15.717032	a) 8*10*12 = 960 cc\r\nb) 160+240+192 = 592 cm^2\r\nc) 4*8 + 4*10 + 4*12 = 32+40+48 = 120 cm	\N	\N	a) 960 cc  b) 592 cm^2  c) 120 cm	Avery	Nicole, Liam, Henry, Shantanu	1
443	8	45	What percent decrease occurs when a stock goes from $6.50 per share to $4.25 per share?		2014-08-08 00:04:09.418575	2014-12-08 15:05:43.789323	(6.50-4.25)/6.50\r\n34.6%	\N	\N	34.6%	Lucia	Caroline	1
438	3	45	Five gerbils cost p dollars. How many dollars will it cost to buy g gerbils? How many gerbils can you purchase for d dollars?		2014-08-04 20:55:09.163757	2014-12-04 17:22:50.841955	One gerbil costs p/5 dollars.\r\ng gerbils would cost (g*p)/5\r\nd/(p/5)\r\nYou can purchase 5d/p gerbils for d dollars.	\N	\N	gp/5 dollars, 5d/p gerbils	Alex	Hannah	1
445	10	45	Using the coordinate-axis system shown in the top view at right, the viewing area of a camera aimed at a mural placed on the x-axis is bordered by y = 7/8 |x|−42. The dimensions are in feet. How far is the camera from the x-axis, and how wide a mural can be photographed?		2014-08-08 00:50:48.546283	2014-12-08 15:21:22.18347	y = 7/8 |x|−42\r\nThe camera is 42 feet from the mural.\r\n7x/8 = 42\r\n7x = 336\r\nx = 48\r\nA mural 96 feet wide can be photographed.\r\n\r\n	PBL_graph_45_10.PNG	\N	42 ft from x-axis, 96 ft. width	Lucia	Ben	1
427	3	44	I recently paid $85.28 for 12.2 pounds of coffee beans. What was the price per pound of the coffee? How many pounds did I buy per dollar?		2014-08-04 19:47:50.069888	2014-12-03 16:13:00.139244	$6.99 per pound\r\n0.143 pounds per dollar\r\n\r\ncheck: 0.143*85.28 =  12.2 \r\n\r\n	\N	\N	a) $6.99 per pound b) 0.1431 pounds	Matt V.	Christian, Liam	1
432	8	44	Write a plausible equation for each of the three graphs shown in the diagram at right.		2014-08-04 20:10:08.490141	2014-12-04 16:57:45.814623	a) y = |x - 1| + 2\r\nb) y = -|x| + 1\r\nc) y = 2|x + 3| - 1	PBL_graph_44_8.PNG	\N	a) y = |x - 1| + 2   b) y = -|x| + 1   c) y = 2|x + 3| - 1	Alex	Henry, Shantanu	1
433	9	44	Sketch the region that is common to the graphs of x ≥ 2, y ≥ 0, and x + y ≤ 6, and find its area.		2014-08-04 20:17:05.951236	2014-12-04 17:02:33.398643	Graph attached, the area of the resulting triangle is 8 sq. units	\N	PBL_ans_44_9.PNG	area is 8 sq. units	Miranda	Matt	1
428	4	44	Find the value of x that fits the equation 1.24x − (3 − 0.06x) = 4(0.7x + 6).		2014-08-04 19:55:23.796186	2014-12-03 16:13:53.318247	1.24x − (3 − 0.06x) = 4(0.7x + 6)\r\n1.24x - 3 + 0.06x = 2.8x + 24\r\n1.3x - 3 = 2.8x + 24\r\n-27 = 3x/2\r\n3x = -54\r\nx = -18\r\n\r\ncheck: 1.24(-18) - (3 - 0.06(-18) = 4(0.7(-18) + 6\r\n-22.32 - 3 + (-1.08) = 4(-12.6 + 6)\r\n-26.4 = -26.4\r\n	\N	\N	-18	Avery	Benji	1
455	9	46	A farmer has 90 meters of fencing material with which to construct three rectangular pens side-by-side as shown at right. If w were 10 meters, what would the length x be?\r\nFind a general formula that expresses x in terms of w.		2014-08-08 16:05:25.520415	2014-12-10 15:26:12.806806	(90-(4*10))/2 = 25\r\nx = (90-(4w))/2	PBL_graph_46_9.PNG	\N	x = (90-(4w))/2	Matt V.	Caroline	1
456	1	47	Find how many pairs (x, y) satisfy the equation x + y = 25, assuming that\r\n(a) there is no restriction on the values of x and y;\r\n(b) both x and y must be positive integers;\r\n(c) the values of x and y must be equal.		2014-08-08 16:09:12.503756	2014-12-11 15:46:04.285671	a) an infinite number of pairs\r\nb) (1,24),(2,23),(3,22)...(22,3),(23,2),(24,1), 24 pairs\r\nc) (12.5, 12.5)	\N	\N	a) infinite b) 24  c) 1	Miranda	Caroline	1
458	3	47	(Continuation) Suppose that Tate takes a ten-minute break after just five minutes of raking. Revise your prediction of how many minutes it will take to complete the job.		2014-08-08 22:40:13.096558	2014-12-11 15:55:18.536397	After 5 minutes Tate has completed 25/150 and Jess 15/50 of the job, for a total of 40/150ths done.\r\nIn the next ten minutes Jess completes 30/150, making a total of 70/150ths.\r\n80/150ths remain, Jess does 30 and Tate 50 in the next 10 minutes.\r\nTotal time, 25 minutes.\r\n\r\ncheck: Tate= 15/30 = .5, Jess, 25/50 = .5 completed.\r\n	\N	\N	25 minutes	Lucia	Caroline	1
460	5	47	Write an inequality that describes all the points that are more than 3 units from 5.		2014-08-08 23:31:30.905936	2014-12-11 15:58:28.662035	also\r\nx < 2 or x > 8	\N	\N	|x-5| > 3	Scott	Henry	1
457	2	47	Working alone, Jess can rake the leaves off a lawn in 50 minutes. Working alone, cousin Tate can do the same job in 30 minutes. Today they are going to work together, Jess starting at one end of the lawn and Tate starting simultaneously at the other end. In how many minutes will they meet and thus have the lawn completely raked?		2014-08-08 22:39:39.390798	2014-12-11 15:46:49.476588	j = 30\r\nt = 5j/3\r\nj + 5j/3 = 1\r\n3j + 5j = 3\r\n8j = 3\r\nj = 3/8 of 30 minutes.\r\nJess can complete 3/8 of the job in the same time that Tate completes 5/8. That will take 18.75 minutes. or 18 minutes and 45 seconds.\r\ncheck:  3/8*50 = 18/75, 5/8*30 = 18.75\r\n\r\n\r\n	\N	\N	18.75 min	Lucia	Matt L	\N
452	6	46	Write a formula that expresses the distance between p and 17. Describe all the possible values for p if this distance is to be greater than 29.		2014-08-08 15:45:04.261242	2014-12-10 15:19:35.290489	d = |17 - p|\r\n29 < |17 - p|\r\n17 - p  > 29 or 17 - p < -29\r\n17-29 > p  or 17- - 29 < p\r\np < -12 or p > 46\r\n\r\n\r\n	\N	\N	p < -12 or p > 46	Jaden	Julia	1
461	6	47	If x varies directly with y, and if x = 5 when y = 27, find x when y = 30.		2014-08-08 23:34:22.828312	2014-12-11 15:59:41.397436	30/x = 27/5\r\n30 = 27x/5\r\nx = 150/27\r\nx = 5.5555\r\n	\N	\N	5.5555->	Suzana	Julia	1
450	4	46	The diagram at the right shows the wire framework for a rectangular box. The length of this box is 8 cm. greater than the width and the height is half the length. A total of 108 cm of wire was used to make this framework.\r\n(a) What are the dimensions of the box?\r\n(b) The faces of the box will be panes of glass. What is the total area of the glass needed for the six panes?\r\n(c) What is the volume of the box?		2014-08-08 02:58:14.766829	2014-12-10 15:12:22.960426	a) w = L - 8, L, h = l/2L\r\n4L - 32 + 4L + 2L = 108\r\n10L - 32 = 108\r\n10L = 140\r\nl = 14, w = 6, h = 7 cm\r\ncheck: (56 + 28 + 24) = 108\r\nb) 2(14*7 + 6*7 + 6*14) = 448 cm^2\r\nc) 14*7*6 = 588 cc\r\n\r\n 	PBL_graph_46_4.PNG	\N	a) 14x6x7  b) 448 cm^2  c) 588 cc	Lucia	Shantanu, Henry	\N
459	4	47	The table at the right shows the value of a car as it depreciates over time. Does this data satisfy a linear relationship? Explain.		2014-08-08 23:30:29.571423	2014-12-11 15:56:21.612373	It does satisfy a linear relationship because in each datapoint the year goes up 1 and the value goes down by 3600. Clearly, though, it can't remain linear as at some point the value would become negative.	PBL_graph_47_3.PNG	\N	yes, as long as values are positive	Maya	Ben 	1
448	2	46	Start with the equations 2x − y = 3 and 3x + 4y = 1. Create a third equation by adding any multiple of the first equation to any multiple of the second equation. When you compare equations with your classmates, you will probably not agree. What is certain to be true about the graphs of all these third equations, however?		2014-08-08 02:44:09.4628	2014-12-08 15:26:20.390838	2x − y = 3 and 3x + 4y = 1\r\n 6x - 3y = 9\r\n-6x - 8y = -2\r\n    -11y = 7\r\n       y = -7/11\r\n12x - 6y = 18\r\n12x + 16y =  4\r\n    -22y = 14\r\n       y = -7/11\r\nThey will have the same simultaneous solution.\r\n\r\n	\N	\N	All have the same intersection point, i.e. simultaneous solution	Suzana	Hannah, Jared	1
449	3	46	The Appalachian Trail is a hiking trail that stretches 2158 miles from Georgia to Maine. The record for completing this hike in the shortest time is 52 days. The record-setting hikers averaged 3 miles per hour. How many hours a day did they average?		2014-08-08 02:48:24.058064	2014-12-10 14:56:56.890176	2158/3 = 719.33 hours hiking\r\n719.33/52 is 13.833 hours per day.\r\n\r\ncheck: 13.833 hours per day is 41.5 miles per day, times 52 is 2158 miles	\N	\N	13.83 hours per day	Miranda	Nicole, Julia	1
453	7	46	You might not have seen an algebra-block diagram yet for a factorization that contains a minus sign. Try drawing a diagram to illustrate the identity 2x^2−x−1 = (2x+1)(x−1).		2014-08-08 15:55:45.288005	2014-12-10 15:21:56.713356	attached	\N	PBL_ans_46_7.PNG	picture	Avery	Matt L.	1
454	8	46	Cameron bought twelve pounds of candy corn for 79 cents a pound, and eighteen pounds of M&Ms for $1.09 a pound, planning to make packages of candy for the Exeter-Andover game. The two types of candy will be mixed and sold in one-pound bags. What is the least price that Cameron can charge for each of the thirty bags, in order to make at least a 25% profit?		2014-08-08 16:02:02.737238	2014-12-10 15:22:40.760577	Cost: 12*.79 + 18*1.09 = 29.10\r\n29.10 * 1.25 = 36.375/30 = 1.2125, or 1.22 per bag to make a profit.\r\n\r\ncheck: 30*1.22 = 36.60, 36.60/29.10 = 1.257	\N	\N	$1.22	Matt K.	Benji	1
462	7	47	Write and graph an equation that states \r\n(a) that the perimeter of an l × w rectangle is 768 cm;\r\n(b) that the width of an l × w rectangle is half its length.		2014-08-08 23:45:54.729738	2014-12-11 16:06:51.262362	2l + 2w = 768\r\nw = L/2	\N	PBL_ans_47_7.PNG	a) 2L+2w = 768 or l+w=384  b) 2w = L	Jaden	Sam, Tori	1
466	1	48	My car averages 29 miles per gallon of gasoline, but I know — after many years of fueling it — that the actual miles per gallon can vary by as much as 3 either way. Write an absolute-value inequality that describes the range of possible mpg figures for my car.		2014-08-09 00:05:12.372744	2014-12-12 16:51:12.192238	|m - 29| <= 3\r\n-> 26 <= m <= 32	\N	\N	|m - 29| <= 3	Jaden, Miranda	Henry	1
471	6	48	To run 10000 meters in a world-class time of 27:30 (27 minutes and 30 seconds), approximately what time should a competitor expect to hear at the 1600-meter mark?		2014-08-09 04:03:25.282569	2014-12-12 17:21:31.380413	27*60+30 = 1650 seconds, so the first 16% should be done in something close to 264 seconds, or 4 minutes and 24 seconds.\r\n	\N	\N	4 min, 24 seconds	Maya	Liam	1
475	10	48	The average of two numbers is 41. If one of the numbers is 27, what is the other number? If the average of two numbers is x + y, and one of the numbers is x, what is the other number?		2014-08-09 04:26:49.876756	2014-12-18 15:10:34.052026	82 - 27 = 55\r\na = 2(x + y) - x 	\N	\N	55, x + 2y	Scott	Hannah, Jared	1
469	4	48	(Continuation) On second thought, I want the mixture to be at least 80% real fruit juice. How much of the 32-ounce bottle can I add to the mixture and be satisfied?		2014-08-09 03:30:02.88195	2014-12-12 17:14:45.715478	t*.8 = (t-48)*.4+48\r\n8t/10 = 4(t-48)/10 + 48\r\n8t = 4t - 192 + 480\r\n4t = 288\r\nt = 72 oz.\r\nAdd 24  oz.\r\ncheck: 24*.4 = 9.6 + 48 = 57.6/72 = 80%\r\n	\N	\N	24 oz.	Matt V.	Matt V., Nicole	1
472	7	48	If you have one x^2-block and two x-blocks, how many 1-blocks do you need to form a square? What are the dimensions of the square? Draw a diagram of the finished arrangement. Fill in the blanks in the equation x^2 + 2x + = ( )( ) = ( )2.		2014-08-09 04:13:04.341553	2014-12-12 17:22:58.313454	One 1 block\r\nDimensions are x+1\r\nx^2 + 2x + 1= (x+1)(x+1) = (x+1)2.	\N	PBL_ans_48_7.PNG	One 1 block	Lucia	Sam	1
473	8	48	Randy has 25% more money than Sandy, and 20% more money than Mandy, who has $1800. How much money does Sandy have?		2014-08-09 04:16:27.665622	2014-12-18 14:55:14.963497	Randy has 1800*1.20 or 2160\r\nSandy has 2160/1.25, or 1728\r\ncheck: 1728*1.25 = 2160\r\n	\N	\N	$1728	Suzana	Christian, Tori	\N
474	9	48	The diagram at the right represents a solid of uniform cross-section. All the lines of the figure meet at right angles. The dimensions are marked in the drawing in terms of x. Write simple formulas in terms of x for each of the following:\r\n(a) the volume of the solid;\r\n(b) the surface area you would have to cover in order to paint this solid;\r\n(c) the length of decorative cord you would need if you wanted to outline all the edges of this solid.		2014-08-09 04:23:51.15376	2014-12-18 15:06:04.54251	a) volume = (x*3x*3x)+(x*2x*3x) = 9x^3 + 6x^3 = 15x^3\r\nb) 9x^2+12x^2+6x^2+4x^2+12x^2+3x^2 = 46x^2\r\nc) 12x + 12x + 24x = 48x	\N	\N	a) 15x^3  b) 46x^2  c) 48x	Lucia	Caroline	1
467	2	48	What algebra blocks would you need to order from the Math Warehouse so that you could build a square whose edges are all x + 4 units long?		2014-08-09 00:07:03.386817	2014-12-12 16:57:57.069981	(x + 4) (x + 4)\r\nx^2 + 8x + 16\r\n1 x^2 block\r\n8 x blocks\r\n16 one blocks	\N	\N	1 x^2 block, 8 x blocks, 16 one blocks	Avery, Zach	Ben	1
477	1	49	Solve each of the following systems of equations:\r\n(a) {3r + 5s = 6\r\n     9r = 13s + 4\r\n(b) {3a = 1 + 1/3(b)\r\n     5a + b = 11		2014-08-09 04:34:50.014897	2014-12-18 15:16:09.831798	(a) {3r + 5s = 6\r\n     9r - 13s = 4\r\nx3   9r + 15s = 18\r\n-       - 28s = -14\r\n            s = 1/2\r\n           3r + 5/2 = 6\r\n           3x = 7/2\r\n            x = 7/6   check: 63/6 - 13/2 = 4   24/6 = 4\r\n(b) {3a = 1 + 1/3(b)\r\n     5a +   b = 11\r\n     3s - b/3 = 1\r\n     5a + b = 11\r\nx3   9a - b = 3\r\n+   14a  = 14\r\n      a = 1\r\n      h = 6   check:  3 - 2 = 1\r\n	\N	\N	a) 7/6, 1/2  b) 1,6	Miranda	Tori, Sam	1
478	2	49	Use the distributive property to write each of the following in factored form:\r\n(a) ab² + ac² (b) 3x² − 6x (c) wx + wy + wz + w		2014-08-09 13:59:25.476809	2014-12-18 15:17:50.513634	(a) ab² + ac²         ->  a(b^2 + c^2)\r\n(b) 3x² − 6x          ->  3x(x - 2)\r\n(c) wx + wy + wz + w  ->  w(x+y+z+1)	\N	\N	a) a(b²+c²)   b) 3x(x - 2)   c) w(x+y+z+1)	Avery	Ben	1
479	3	49	Most of Conservative Casey’s money is invested in a savings account that pays 1% interest a year, but some is invested in a risky stock fund that pays 7% a year. Casey’s total initial investment in the two accounts was $10000. At the end of the first year, Casey received a total of $250 in interest from the two accounts. Find the amount initially invested in each. 		2014-08-09 14:17:23.149879	2014-12-18 15:18:55.264323	a*.01 + f*.07 = 250\r\na + f = 10000\r\na = 10000 - f\r\n10000*.01 - .01f + .07f = 250\r\n.06f = 150\r\nf = 2500\r\ns = 7500\r\ncheck: 2500*.07 + 7500*.01 = 175 + 75 = 250\r\n	\N	\N	$2500 at 7% and 7500 at 1%	Jaden	Ben	1
468	3	48	Shaw’s carries two types of apple juice. One is 100% fruit juice, while the other is only 40% juice. Yesterday there was only one 48-ounce bottle of the 100% juice left. I bought it, along with a 32-ounce bottle of the 40% juice. I am about to mix the contents of the two bottles together. What percent of the mixture will be actual fruit juice?		2014-08-09 03:10:12.802612	2014-12-12 17:00:36.028918	Bottle 1, 48 oz. juice\r\nBottle 2, 32*.4 or 12.8 oz.\r\n60.8/80 = 76% fruit juice.	\N	\N	76%	Suzana	Nicole, Matt	1
470	5	48	Solve each of the systems of equations below\r\n(a) { 3x + 4y = 1\r\n      4x + 8y = 12\r\n(b) { 2x + 3y = −1\r\n      6x − 5y = −7		2014-08-09 03:52:22.06622	2014-12-12 17:15:08.144506	(a) { 3x + 4y = 1\r\n      4x + 8y = 12\r\nx2    6x + 8y = 2\r\n-     4x + 8y = 12  \r\n      2x      = -10\r\n            x = -5\r\n            y = 4      check: -20 + 32 = 12\r\n(b) { 2x + 3y = −1\r\n      6x − 5y = −7\r\nx3    6x + 9y = -3\r\n-     6x − 5y = −7\r\n          14y = 4\r\n            y = 2/7\r\n           2x = -6/7 - 1\r\n           2x = -13/7\r\n            x = -13/14     check: -26/14 + 12/14 = -14/14	\N	\N	a) -5,4  b) -13/14, 2/7	Matt K.	Caroline, Simon	1
465	10	47	The owner’s manual for my computer printer states that it will print a page in 12 seconds. Re-express this speed in pages per minute, and in minutes per page.		2014-08-09 00:03:02.084996	2014-12-11 16:15:56.690827	5 pages per minute.\r\n12/60 or 1/5 of a minute per page.	\N	\N	5 ppm, .2 min per page	Matt V.	Liam	1
476	11	48	A restaurant has 23 tables. Some of the tables seat 4 persons and the rest seat 2 persons. In all, 76 persons can be seated at once. How many tables of each kind are there?		2014-08-09 04:32:53.531006	2014-12-18 15:12:28.169318	 b + s = 23\r\n4b + 2s = 76\r\n2b + 2s = 46\r\n2b = 30\r\nb = 15\r\ns = 8\r\ncheck: 60 + 16 = 76	\N	\N	15 seat 4, 8 seat 2	Matt K.	Liam	1
482	6	49	The diagram at right shows a calculator screen on which the lines 5x + 4y = 32 and −5x + 6y = 8 have been graphed. The window settings for this diagram consist of two inequalities, a ≤ x ≤ b and c ≤ y ≤ d, in which the numbers a, b, c, and d are determined by the diagram. What are these numbers?		2014-08-09 15:39:59.91656	2015-01-06 16:18:04.218383	a = -4\r\nb = 8\r\nc = -2\r\nd = 8	PBL_graph_48_6.PNG	PBL_ans_48_6.PNG	a- -4, b = 8, c=-2 d= 8	Lucia	Matt, Simon	1
487	2	50	Find values for a and b that make ax+by = 14 parallel to 12−3y = 4x. Is there more than one answer? If so, how are the different values for a and b related?		2014-08-09 18:49:53.736871	2015-01-07 16:50:14.438093	12−3y = 4x\r\n4x + 3y = 12\r\n3y = -4x + 12\r\n3y = -4x + 12\r\ny = -4x/3 + 4\r\na = 4, b = 3, a = 8, b = 6, a = 4, b = 3, etc. They all make the same slope and describe parallel lines.\r\n	\N	PBL_ans_50_2.PNG	3a = 4b	Matt K. 	Henry, Shantanu, Carolline	1
489	4	50	Exponents are routinely encountered in scientific work, where they help investigators deal with large numbers:\r\n(a) The human population of Earth is roughly 7000000000, which is usually expressed in scientific notation as 7 × 109. The average number of hairs on a human head is 5 × 105. Use scientific notation to estimate the total number of human head hairs on Earth.\r\n(b) Light moves very fast — approximately 3 × 108 meters every second. At that rate, how many meters does light travel in one year, which is about 3 × 107 seconds long? This so-called light year is used in astronomy as a yardstick for measuring even greater distances.		2014-08-09 19:11:24.079321	2015-01-07 17:10:53.13387	a) 3.5 x 10^15\r\nb) 9 x 10^15	\N	\N	a) 3.5 x 10^15  hairs  b) 9 x 10^15 m	Suzana	Hannah	1
483	7	49	For the final in-class test in math this term, I am thinking of giving a 100-question true-false test! Right answers will count one point, wrong answers will deduct half a point, and questions left unanswered will have no effect. One way to get a 94 using this scoring system is to answer 96 correctly and 4 incorrectly (and leave 0 blank). Find another way of obtaining a score of 94.		2014-08-09 15:42:40.864589	2015-01-06 16:19:06.588953	94 correct and none incorrect\r\n95 correct and 2 incorrect	\N	\N	94 right, 0 wrong, 6 blank, 95 right, 2 wrong, 3 blank	Alex	Liam, Benji	1
485	9	49	A large family went to a restaurant for a buffet dinner. The price of the dinner was $12 for adults and $8 for children. If the total bill for a group of 13 persons came to $136, how many children were in the group?		2014-08-09 18:38:42.76051	2015-01-06 16:23:59.752473	12a + 8c = 136\r\na + c = 13\r\nc = 13 - a\r\n12a + 104 - 8a = 136\r\n4a = 32\r\na = 8, c = 5\r\ncheck: 12*8 + 8*5 = 136	\N	\N	8 adults and 5 children	Matt V.	Nicole, Julia	1
490	5	50	A car went a distance of 90 km at a steady speed and returned along the same route at half that speed. The time needed for the whole round trip was four hours and a half. Find the two speeds.		2014-08-09 19:15:36.965027	2015-01-07 17:14:07.544482	90/2s + 90/s = 4.5\r\n90/2s + 180/2s = 4.5\r\n90 + 180 = 9s\r\n270 = 9s\r\ns = 30 kmph\r\n2s = 60 kmph\r\ncheck:  90/30 + 90/60 = 3 + 1.5 = 4.5	\N	\N	60 and 30 kph	Maya	Nicole, Liam, Matthew	1
491	6	50	Solve the equation 1.2x + 0.8(20 − x) = 17.9 for x. Make up a word problem that could use this equation in its solution. In other words, the equation needs a context		2014-08-09 20:57:02.886369	2015-01-07 17:15:32.844946	1.2x + 0.8(20 − x) = 17.9\r\n12x + 160 - 8x = 179\r\n4x = 19\r\nx = 19/4 or 4.75\r\ncheck:  5.7 + 16 - 3.8 = 17.9\r\nYou bought $17.90 worth of fish at the market. The base price is $1.20 per pound, but if you buy less than 20 pounds a surcharge of 80 cents for each pound less than 20 is added. How many pounds did you buy?\r\n	\N	\N	x = 4.75		Nicole, Julia	1
486	1	50	Write each of the following in factored form:\r\n(a) 2x² + 3x³ + 4x^4 (b) 5xp + 5x (c) 2πr^2 + 2πrh		2014-08-09 18:42:17.228381	2015-01-07 16:48:01.156693	(a) 2x² + 3x^3 + 4x^4  ->  x²(2+3x+4x^2)\r\n(b) 5xp + 5x            ->  5x(p + 1)\r\n(c) 2πr^2 + 2πrh       ->  2πr(r + h)	\N	\N	a) x²(2+3x+4x²)  b) 5x(p + 1)  c) 2πr(r + h)	Scott	Christian, Simon	1
492	7	50	The diagram at right shows the graphs of four lines, whose equations are y = 2x + 3, x + y = 3, 4x + 3y = 24, and 3x − y = 9.\r\n(a) Find coordinates for the intersection point M.\r\n(b) Write a system of simultaneous inequalities that describes\r\nthe shaded region.		2014-08-09 21:12:00.814338	2015-01-08 15:50:11.724832	   3x - y = 9\r\n   4x + 3y = 24\r\nx3 9x - 3y = 27\r\n+ 13x      = 51\r\n    x = 51/13\r\n  153/13 - y = 117/13\r\n13y = 36\r\n  y = 13/36\r\nb) y < 2x + 3 and y < -4/3x + 8 and y > -x + 3 and y > 3x - 9	PBL_graph_50_7.PNG	PBL_ans_50_7.PNG	a) 51/13, 13/36		Caroline	1
493	8	50	Write the following sentence using mathematical symbols:\r\n“The absolute value of the sum of two numbers a and b is equal to the sum of the absolute values of each of the numbers a and b.” \r\nIs this a true statement? Explain.		2014-08-09 21:16:32.046858	2015-01-08 16:00:22.508507	|a + b| = |a| + |b|\r\nNo, it isn't always true, for example, if a is 4 and b is -3, |a + b| would be 1, while |a| + |b| would be 7.\r\nIt is true if a and b have the same sign. \r\n	\N	\N	|a + b| = |a| + |b|		Ben	1
502	9	0	A laser beam is shot from the point (0, 2.35) along the line whose slope is 3.1. Will it hit a very thin pin stuck in this coordinate plane at the point (10040, 31126)?	test	2014-08-10 15:39:17.150402	2014-08-10 15:39:17.150402	(y - 2.35) = 3.1(x)\r\ny = 3.1(x) + 2.35\r\n31126 = 3.1(10040) + 2.35\r\n31126 != 31126.25\r\nIt depends on how thin the pin is, how wide the laser beam is, and what units are being used. If it's millimeters and the pin is more than .5 mm in diameter the beam would just hit it if it has any width at all, which it must.\r\n	\N	\N	\N	\N	\N	\N
497	4	51	If it costs d dollars to buy p gizmos, how much will it cost to buy k gizmos?		2014-08-10 04:36:44.015724	2015-01-09 15:01:37.549505	k*(d/p)	\N	\N	k*(d/p) or dk/p	Zach	Shantanu, Matt	1
503	9	0	A laser beam is shot from the point (0, 2.35) along the line whose slope is 3.1. Will it hit a very thin pin stuck in this coordinate plane at the point (10040, 31126)?		2014-08-10 15:39:56.742315	2014-08-10 15:39:56.742315	(y - 2.35) = 3.1(x)\r\ny = 3.1(x) + 2.35\r\n31126 = 3.1(10040) + 2.35\r\n31126 != 31126.25\r\nIt depends on how thin the pin is, how wide the laser beam is, and what units are being used. If it's millimeters and the pin is more than .5 mm in diameter the beam would just hit it if it has any width at all, which it must.\r\n	\N	\N	\N	\N	\N	\N
403	8	0	What are the x- and y-intercepts of y = |x − h| + k, and what are the coordinates of its vertex?		2014-08-03 21:17:52.745448	2014-08-03 21:17:52.745448	y = |x − h| + k\r\nx intercept -> 0 = |x − h| + k -> -k = |x-h|  ->  -k = x-h or k = x-h  ->   x = -k-h or x = -k+h, though this only occurs if k is less than zero.\r\ny intercept -> y = |-h| + k  ->  y = k - h\r\nvertex is (h,k)	\N	\N	\N	\N	\N	\N
508	2	52	Impeded by the current, the Outing Club took 4 hours and 24 minutes to paddle 11 km up the Exeter River to their campsite last weekend. The next day, the current was with them, and it took only 2 hours to make the return trip to campus. Everyone paddled with the same intensity on both days. At what rate would the paddlers have traveled if there had been no current? What was the speed of the current?		2014-08-10 17:28:45.304403	2015-01-13 14:59:31.364409	with current rate is 5.5 kpm\r\nagainst current rate is 2.5\r\nb - r = 2.5\r\nb = r + 2.5\r\nb + r = 5.5\r\n2r + 2.5 = 5.5\r\n2r = 3\r\nr = 1.5\r\nb = 4\r\n	\N	\N	4 kph, 1.5 kph	Lucia	Julia, Jarod	1
496	3	51	The figure shows the graphs of two lines, whose axis intercepts are integers. Use the graphs to estimate the coordinates of the point that belongs to both lines, then calculate the exact value. You will of course have to find equations for the lines		2014-08-10 04:35:09.018642	2015-01-09 14:59:09.604889	estimated point (2,2)\r\ny = -3/5(x) + 3\r\ny = 2x - 2\r\n  3/5x + y = 3\r\n-  -2x + y = -2\r\n  13x/5    = 5\r\n13x = 25\r\n  x = 25/13\r\n  y = 50/13 - 26/13 = 24/13\r\n	Math1_51-3.PNG	\N	y = 2x - 2, y = -3/5(x) + 3, (25/13, 24/13)	Matt K.	Julia	1
499	6	51	In a coordinate plane, shade the region that consists of all points that have positive x- and y-coordinates whose sum is less than 5. Write a system of three inequalities that describes this region.		2014-08-10 15:20:40.65052	2015-01-09 15:18:05.381039	{ x + y < 5\r\n  x > 0\r\n  y > 0	\N	PBL_ans_51_6.PNG	{ x + y < 5,   x > 0,   y > 0	Miranda	Nicole	1
500	7	51	Suppose that h is 40% of p. What percent of h is p?		2014-08-10 15:24:50.822858	2015-01-09 15:20:52.756833	h = 4p/10\r\n4p = 10h\r\np = 2.5h\r\n250%	\N	\N	250%	Matt V.	Ben, Matt	1
504	9	51	A laser beam is shot from the point (0, 2.35) along the line whose slope is 3.1. Will it hit a very thin pin stuck in this coordinate plane at the point (10040, 31126)?		2014-08-10 15:42:10.767403	2015-01-09 15:26:29.565597	(y - 2.35) = 3.1(x)\r\ny = 3.1(x) + 2.35\r\n31126 = 3.1(10040) + 2.35\r\n31126 != 31126.35\r\nIt depends on how thin the pin is, how wide the laser beam is, and what units are being used. If it's millimeters and the pin is more than .75 mm in diameter the beam would just hit it if it has any width at all, which it must.\r\n	\N	\N	no unless the pin is big. 	Alex	Sam	1
509	3	52	The point (2, 3) lies on the line 2x + ky = 19. Find the value of k.		2014-08-10 17:30:23.196611	2015-01-13 15:00:18.655443	2*2 + 3k = 19\r\n3k = 15\r\nk = 5	\N	\N	k = 5	Miranda	Hannah, Simon, Sam, Matt	1
505	10	51	The Exeter Tree Company charges a certain amount per cord for firewood and a fixed amount for each delivery, no matter how many cords are delivered. My bill from ETC last winter was $155 for one cord of wood, and my neighbor’s was $215 for one and one-half cords. What is the charge for each cord of wood and what is the delivery charge?		2014-08-10 16:52:24.937449	2015-01-09 15:30:52.561114	215-155 = 60 for half a cord\r\n120 per cord\r\n155 - 120 = 35 dollar delivery charge	\N	\N	$120 per cord, $35 delivery charge	Suzana, Scott	(Nicole)	1
498	5	51	Find three lattice points on the line x + 3y = 10. \r\nHow many others are there?		2014-08-10 04:39:10.721249	2015-01-09 15:01:57.107384	(1,3), (4,2), (7,1), (10,0), (13, -1)\r\nThere are an infinite number of lattice points.	\N	\N	Infinite number of lattice points	Avery	Henry, Matt	1
512	6	52	Using an absolute-value inequality, describe the set of numbers whose distance from 4 is greater than 5 units. Draw a graph of this set on a number line. Finally, describe this set of numbers using inequalities without absolute value signs.		2014-08-11 00:54:42.803488	2015-01-13 15:21:16.475689	|x - 4| > 5\r\n====|====o----|----|----|----|----|----|----|----|----|----o====|====\r\n   -2   -1    0    1    2    3    4    5    6    7    8    9   10\r\n-1 < x or x > 9	\N	\N	|x - 4| > 5 , -1 < x or x > 9	Matt K.	Sam	1
506	11	51	A long-distance telephone call costs $2.40 plus $0.23 per minute. Write an inequality that states that an x-minute call costs at most $5.00. Solve the inequality to find the maximum number of minutes that it is possible to talk without spending more than $5.00.		2014-08-10 16:55:45.799602	2015-01-13 14:47:55.466887	2.4 + .23m <= 5\r\n.23m <= 2.6\r\nm <= 11.3 minutes is the maximum, or 11 minutes even if there isn't a facility for fractional minutes.\r\n	\N	\N	2.4 + .23m <= 5, 11 minutes	Maya	Caroline	1
510	4	52	Taylor works after school in a health-food store, where one of the more challenging tasks is to add cranberry juice to apple juice to make a cranapple drink. A liter of apple juice costs $0.85 and a liter of cranberry juice costs $1.25. The mixture is to be sold for exactly the cost of the ingredients, at $1.09 per liter. How many liters of each juice should Taylor use to make 20 liters of the cranapple mixture?		2014-08-11 00:26:08.28316	2015-01-13 15:11:26.616612	.85a + 1.25c = 20*1.09\r\na = 20-c\r\n.85(20-c) + 1.25c = 21.8\r\n17 - .85c + 1.25c = 21.8\r\n.4c = 4.8\r\nc = 12, a = 8\r\ncheck: 8*.85+12*1.25 = 6.8 + 15 = 21.8\r\n	\N	\N	12 cranberry, 8 apple	Suzana	Matt, Henry	1
603	1	64	From the tombstone of Diophantus, a famous Greek mathematician: “God granted him to be a boy for a sixth part of his life, and, adding a twelfth part to this, He clothed his cheeks with down. He lit him the light of wedlock after a seventh part, and five years after this marriage He granted him a son. Alas! late-born wretched child — after attaining the measure of half his father’s life, chill Fate took him. After consoling his grief by his science of numbers for four more years, then did Diophantus end his life.” Calculate how old Diophantus lived to be.		2014-08-15 04:59:29.574312	2015-02-10 17:14:42.478425	a/2 = a/6+a/12+a/7+9\r\na/2 = a/6+a/12+a/7+9\r\na/2 - 9 = 14a/84+7a/84+12a/84\r\na/2 - 9 = 33a/84\r\n42a - 756 = 33a\r\n9a = 756\r\n84 years\r\n	\N	\N	84 years	Suzana	Matt, Shantanu	1
616	7	65	Use what you have just seen to explain why √20 = √4 · √5 = 2√5.\r\nRewrite the following square roots in the same way — as the product of a whole number and a square root of an integer that has no perfect square factors. The resulting expression is said to be in simplest radical form.\r\n(a) √50 \r\n(b) √108 \r\n(c) √125 \r\n(d) √128		2014-08-15 20:57:47.606959	2015-02-13 18:41:43.66115	If √4 · √5 = √20 then the reverse must be true also.\r\n(a) √50   = √25· √2 = 5 · √2  \r\n(b) √108  = √9· √4· √3 = 6· √3\r\n(c) √125 = √25· √5 = 5 · √5\r\n(d) √128 = √64· √2 = 8 · √2\r\n	\N	\N	a) 5 · √2   b) 6· √3   c) 5 · √5   d)  8 · √2	Scott		1
515	1	53	A polynomial is obtained by adding (or subtracting) monomials. Use the distributive property to rewrite each of the following polynomials in factored form. In each example, you will be finding a common monomial factor .\r\n(a) x² − 2x (b) 6x² + 21x (c) 80t − 16t² (d) 9x^4 − 3x³ + 12x² − x\r\nA binomial is the sum of two unlike monomials, and a trinomial is the sum of three unlike monomials. The monomials that make up a polynomial are often called its terms.		2014-08-11 03:48:41.778293	2015-01-20 03:39:20.800082	(a) x² − 2x                 ->  x(x - 2)\r\n(b) 6x² + 21x               ->  x(6x + 21)\r\n(c) 80t − 16t²              ->  16t(5 - t)\r\n(d) 9x^4 − 3x³ + 12x² − x  ->  x(9x³ - 3x² + 12x - 1)	\N	\N	a) x(x - 2)  b) 3x(2x + 7)  c) 16t(5 - t   d) x(9x³ - 3x² + 12x - 1)	Avery	Henry, Christian	1
519	5	53	The world is consuming approximately 87 million barrels of oil per day.\r\n(a) At this rate of consumption, how long will the known world oil reserves of 1.653×10^12 barrels last? \r\n(b) Uganda has recently discovered a large deposit of oil in the Lake Albert basin. It is estimated that this deposit holds as many as 6 billion barrels of oil. In how much time would this amount be consumed by worldwide demand?		2014-08-11 07:25:18.092193	2015-01-12 15:16:48.806343	Daily consumption, 8.7x10^6\r\n1.653*10^12/8.7*10^7\r\n0.19*10^5 or 1.9*10^4, or about 19,000 days, which is about 52 years.\r\nb) 6,000,000,000 = 6*10^9\r\n6*10^9/8.7*10^7, or about .69*10^2, or about 69 days. \r\n	\N	\N	a) ~19,000 days or 52.1 years   b) 68.97 days 	Matt V.		1
522	1	54	Faced with the problem of calculating (5^4)^3, Brook is having trouble deciding which of these three answers is correct: 5^64, 5^12, or 5^7. Once you have answered Brook’s question,\r\nexperiment with other examples of this type until you are ready to formulate the principle that tells how to write (b^m)^n as a power of b.		2014-08-11 15:35:00.388639	2015-01-15 16:42:33.711988	(5^4)^3 would simplify to (5*5*5*5)(5*5*5*5)(5*5*5*5) which can then be simplified to (5*5*5*5*5*5*5*5*5*5*5*5) which is 5^12.\r\nThe rule is to multiply the inner exponent times the outer exponent, i.e. (b^m)^n becomes b^(m*n)	\N	\N	b^(m*n)	Garrett	Nicole	1
516	2	53	The simultaneous conditions x − y < 6, x + y < 6, and x > 0 define a region R. How many lattice points are contained in R?		2014-08-11 04:12:30.30569	2015-01-14 15:45:17.540983	25 lattice points	\N	PBL_ans_53_2.PNG	25 lattice points	Maya	Benji, Liam	1
517	3	53	In 7^4 · 7^4 · 7^4 = (7^4)Δ and b^9 · b^9 · b^9 · b^9 = (b^9)∇, replace the triangles by correct exponents. The expression (p^5)^6 means to write p^5 as a factor how many times? \r\nTo rewrite this expression without exponents as p·p·p · · ·, how many factors would you need?		2014-08-11 04:17:20.275452	2015-01-14 16:04:25.257764	(7^4)^3\r\n(b^9)^4\r\n6 times.\r\nYou would need to write 30 factors.	\N	\N	3, 4, 6, 30	Jaden	Matt , Shantanu	1
523	2	54	The diameter of an atom is so small that it would take about 10^8 of them, arranged in a line, to span one centimeter. It is thus a plausible estimate that a cubic centimeter contains about 10^8 ×10^8 ×10^8 = (10^8)^3 atoms. Write this huge number as a power of 10.		2014-08-11 15:37:21.145957	2015-01-15 16:43:37.370451	10^24	\N	\N	10^24	Suzana	Henry	1
518	4	53	Graph the system of equations shown at right. What special relationship exists between the two lines? Confirm this by solving the equations algebraically.		2014-08-11 07:08:55.884348	2015-01-14 16:07:55.650529	They are the same line. \r\n   y = 3x - 10\r\n  2y = 6x - 20\r\n- 2y = 6x - 20\r\n   0 = 0\r\nAny point that satisfies one will satisfy the other.	PBL_graph_53_4.PNG	PBL_ans_53_4.PNG	They are the same line.	Alex	Caroline, Julia, 	1
521	7	53	The cooling system of Alex’s car holds 10 quarts. It is now filled with a mixture that is 60% water and 40% antifreeze. Hearing a weather forecast for severe cold, Alex decides to increase the strength of the antifreeze mixture to 50%. To do this, Alex must drain off a certain number of quarts from the cooling system and then replace them by pure antifreeze. How many quarts must be drained?		2014-08-11 15:29:33.055899	2015-01-14 16:26:49.306544	Currently 4 quarts antifreeze and 6 quarts water. Need to remove one quart of water, requires draining 1/.6 or 1.67 quarts of the mixtur, since to remove 1 quart of water in the mixture you need to remove 2/3 as much antifreeze. \r\n\r\n\r\n	\N	\N	5/3 or 1.67 quarts	Lucia	Sam	1
526	5	54	During a phone call about the system of equations {5x+2y = 8 ; 8x+4y = 8}, Dylan told Max, “It’s easy, just set them equal to each other.” But Max replied, “That doesn’t help — I get −2y = 3x. What good is that?” Help these two students solve the problem.		2014-08-11 19:20:44.602522	2015-01-15 17:10:04.358164	-2y = 3x allows for a substitution in the 5x+2y = 8 equation, after it is rewritten 2y = -3x.\r\n5x-3x = 8\r\n2x = 8\r\nx = 4\r\ny = -6\r\ncheck:  8*4 + 4*-6 = 32 - 24 = 8	\N	\N	(4, -6), in any case you still need to solve the system	Miranda	Ben	1
532	3	55	The figure shows a loading dock and a side view of an attached ramp, whose run is 12 feet and whose rise is 39 inches. Alex is wondering whether a long rectangular box can be stored underneath the ramp, as suggested by the dotted lines. The box is 2 feet tall and 5 feet long. Answer Alex’s question.		2014-08-12 00:04:08.119512	2015-01-20 18:53:23.955134	slope of line is 39/144.\r\nEquation is y = 39x/144\r\nPlug in 84 as near end of box is 7 feet from beginning.\r\ny = (39*84)/144\r\ny = 22.75 inches, the box will not fit under the ramp.	PBL_graph_55_3.PNG	PBL_ans_55_3.PNG	No, the ramp is only 22.75 inches high 5 feet in from the top.	Jason	Liam	1
529	8	54	Graph the equation |x| + |y| = 6. Notice that the graph has several vertices. Shade the region described by |x| + |y| ≤ 6.		2014-08-11 20:15:58.02651	2015-01-15 17:25:25.360117	Attached	\N	PBL_ans_54_8.PNG	Graph attached	Lucia	Liam	1
604	2	64	Factor each of the following quadratic expressions:\r\n(a) x² + 4x (b) 2x² − 6x (c) 3x² − 15x (d) −2x² − 7x		2014-08-15 14:56:00.112219	2015-02-10 17:45:17.386116	(a) x² + 4x    -> x(x + 4)\r\n(b) 2x² − 6x   -> 2x(x - 3) \r\n(c) 3x² − 15x  -> 3x(x - 5) \r\n(d) −2x² − 7x - > x(-2x - 7)	\N	\N	a) x(x + 4)   b) 2x(x - 3)   c) 3x(x - 5)   d) -x(2x + 7)	Matt K.	Henry, Simon	1
533	4	55	Solve the system {ax + ky = 1 , 2ax − ky = 8} for x and y in terms of a and k.		2014-08-12 00:09:10.551492	2015-01-20 19:02:18.144938	-\r\n{  ax + ky = 1 \r\n  2ax − ky = 8\r\n+ 3ax      = 9\r\n    x      = 3/a\r\n    3 + ky = 1\r\n        ky = -2\r\n         y = -2/k\r\n	\N	\N	3/a, -2/k	Maya	Hannah	1
536	7	55	The world is consuming approximately 87 million barrels of oil per day. The United States is consuming approximately 19 million barrels of oil per day.\r\n(a) It is estimated that oil shale in the Green River basin of the Rocky Mountains holds approximately 800 billion barrels of recoverable oil. At the current rate of consumption, how long would this supply the world with oil?\r\n(b) Using current technology, production of each barrel of oil from oil shale requires between 2 and 3 barrels of water. How many barrels of water would be required annually to supply the United States from oil shale?\r\n(c) In 2005, the annual water consumption of the state of Colorado was 15300000 acrefeet. Compare this amount with your answer to part (b). [One acre-foot is 325851 gallons, and a barrel is equivalent to 42 gallons.]		2014-08-12 05:13:59.17685	2015-02-02 18:28:12.042495	a) 8*10^11/8.7*10^7  9.2&10^3 days, or about 9,200 days, which is about 25.18 years, \r\nb) average: 2.5*8.7*10^7 = 2.175*10^8 * 365  -< 7.93*10^10 barrels of water.\r\n   2*1.9*10^7 = 3.8*10^7 per day, or 1.388*10^10 per year\r\n   3*1.9*10^7 = 5.7*10^7 per day or 2.082*10^10 per year\r\nc) 1.53*10^7 * 325,851 /42 ->  1.19*10^11   This number is a little bit higher than the one above.	\N	\N	a) 9195.4 days or 25.2 years b) between 1.388*10^10 and 2.082*10^10 per year c) 1.19*10^11	Avery	Ben, Jared	1
528	7	54	The figure at right shows the graphs of two lines. Use the figure to estimate the coordinates of the point that belongs to both lines, then calculate the exact value. You will of course have to find equations for the lines, which both go through designated lattice points.\r\n		2014-08-11 20:15:22.327287	2015-01-15 18:51:34.464268	Estimated point -> (3, 1.2)\r\nLine one goes through (4,2) and (-2,-3). Slope is 5/6, equation is y - 2 = 5/6(x - 4)  or  y = 5x/6 - 4/3\r\nLine two goes through (6,-1) and (-1,4). Slope is 5/-7, equation is y + 1 = -5/7(x - 6) or y = -5x/7 +23/7\r\n  y - 5x/6 = - 4/3\r\n- y + 5x/7 =  23/7\r\n5x/6 + 5x/7 = 4/3 + 23/7\r\n35x/42 + 30x/42 = 28/21 + 69/21\r\n65x/42 = 194/42\r\n65x = 194\r\nx = 194/65 \r\n  y - 5(194/65)/6 = - 4/3\r\n6y - 194/13 = -24/3\r\n6y = -24/3 + 194/13\r\n6y = -312/39 + 582/39\r\n6y = 270/39\r\ny = 270/234\r\nvery close to my estimates\r\n	PBL_graph_54_7.PNG	PBL_ans_54_7.PNG	194/65, 135/117 or 15/13	Avery	(Matt)	1
535	6	55	Find k so that the three equations 3x−y = 2, 2x+8 = 3y, and y = kx have a common solution.		2014-08-12 05:00:29.164296	2015-01-20 19:06:19.248615	    3x−y = 2\r\n   2x-3y = -8\r\n-  9x-3y =  6\r\n     -7x = -14\r\n       x = 2\r\n   6 - y = 2\r\n       y = 4\r\ncheck: 2*2 + 8 = 3*4  12 = 12\r\n4 = 2k\r\nk = 2\r\n	\N	\N	x = 2, y = 4, k = 2	Avery	Sam	1
525	4	54	On the same axes, sketch the graphs of y = |x − 3| and y = 4 − |x − 3|. Label the points of intersection with coordinates. Find the area enclosed.		2014-08-11 19:16:17.569794	2015-01-15 17:03:55.863207	Graph attached	\N	PBL_ans_54_4.PNG	(1,2) and (5,2), area is 8	Maya	Sam	1
534	5	55	Lee spent c cents to buy five pears. In terms of c and d, how many pears could Lee have bought with d dollars?		2014-08-12 00:24:14.803723	2015-01-20 19:06:57.235985	1 pear costs c/5.\r\nd = c/100\r\nIn dollars 1 pear costs c/500.\r\nd dollars would buy d/(c/500).\r\n\r\ncheck: c = 25, 1 pear is 5 cents. In dollars, 1 pear is .05, 25/500. If I had 1 dollar it would buy 1/(25/500) or 20 pears.\r\n	\N	\N	500d/c	Matt	Simon	1
530	1	55	A math teacher is designing a test, and wants (3,−4) to be the solution to the system of equations {3x − 5y = a ; 7x + y = b}. What values should the teacher use for a and b?		2014-08-11 20:29:07.445033	2015-01-20 18:43:28.059942	3*3 + 5*4 = 29 for a\r\n3*7 + -4 = 17 for b	\N	PBL_ans_55_1.PNG	a = 29, b =17	Lucia	Nicole	1
531	2	55	A square can be formed from one x2-block, a hundred x-blocks and a certain number of 1-blocks. How many 1-blocks? Show how to do it. What are the dimensions of the square? Fill in the blanks in the equation x^2 +100x+ = ( )( ) = ( )^2.		2014-08-11 23:56:55.525357	2015-01-20 18:47:33.672008	x² +100x+ 2500 = (x + 50)(x + 50 ) = (x + 50)²\r\n50x is the side of the square.	\N	PBL_ans_55_2.PNG	2500 = (x + 50)(x + 50 ) = (x + 50)²	Jaden	Matt , Shantanu	1
546	7	56	Replace the triangles in (x · x · x · x · x · x · x)/(x · x · x · x) = x^Δ and 6^9/6^4 = 6^∇ by correct exponents.		2014-08-12 15:52:47.769058	2015-01-23 16:55:02.849245	(x · x · x · x · x · x · x)/(x · x · x · x) = x^3\r\n6^9/6^4 = 6^5	\N	\N	3 and 5	Suzana	Sam	1
540	1	56	Sandy can saw three cords of wood in a standard workday, if the whole day is spent doing it. Sandy can split five cords of wood in a standard workday, if the whole day is spent doing it. In a standard workday, what is the largest number of cords of wood that Sandy can saw and split?		2014-08-12 05:56:51.389467	2015-01-23 15:37:36.172109	Cord rate = 1/3 of a day\r\nSplit rate = 1/5 of a day\r\nx/3 + x/5 = 1\r\n5x/15 + 3x/15 = 1\r\n8x/15 = 1\r\nx = 15/8 = 1 7/8\r\n1/3+1/3+1/5+1/5 = 5/15+5/15+3/15+3/15 = 16/15\r\nSo, counting by whole cords, just one. Going by fractions, he could cut and split 15/45+13/45+9/45+8/45 which would make 45/45 or a whole day, and he would have cut 1 13/15 cords, and split 1 8/9 cords.	\N	\N	1 7/8	Scott	Matt, Shantanu	1
544	5	56	Jan had the same summer job for the years 1993 through 1996, earning $250 in 1993, $325 in 1994, $400 in 1995, and $475 in 1996.\r\n(a) Plot the four data points, using the horizontal axis for “year”. You should be able to draw a line through the four points.\r\n(b) What is the slope of this line? What does it represent?\r\n(c) Which points on this line are meaningful in this context?\r\n(d) Guess what Jan’s earnings were for 1992 and 1998, assuming the same summer job.\r\n(e) Write an inequality that states that Jan’s earnings in 1998 were within 10% of the amount you guessed.		2014-08-12 15:40:09.221321	2015-01-23 16:51:55.324029	a) graph attached\r\nb) the slope is 75, it represents his 75 dollar increase per year\r\nc) only the part that starts at 1993 and goes up, and the part going down to 0.\r\nd) 1992 -> $175,  1998 ->  625 \r\ne) |e - 625| <= 62.5 or 562.5 <= e <= 687.5	\N	PBL_ans_56_5.PNG	a) graph b) $75 per year c) lattice points  d) $175, 625 e) |e - 625| <= 62.5	Jaden	Henry, Nicole	1
542	3	56	You have one x2-block and 2n x-blocks, where n is a positive whole number. How many 1-blocks do you need to make a square? What are the dimensions of the square?\r\nFill in the blanks in the equation x² + 2nx + = ( )( ) = ( )².		2014-08-12 15:11:53.783498	2015-01-23 15:20:55.522898	You need n^2 1-blocks. A side of the square is x + n.\r\nx² + 2nx + n² = (x + n)(x + n) = (x + n)².	\N	\N	n²;(x + n)²	Maya	Julia	1
539	10	55	Let n be a positive integer, and let R be the region defined by the simultaneous conditions x − y < n, x + y < n, and x > 0. In terms of n, how many lattice points are contained in R?		2014-08-12 05:42:47.764132	2015-01-18 17:22:50.857664	It makes a 1+3+5+7+... pattern, which always adds to a perfect square, which is (n-1)².	\N	\N	(n-1)(n-1)			1
545	6	56	Now that you have dealt with systems of two-variable equations, you can apply the same principles to solve systems of three-variable equations. For example, you can (temporarily) eliminate y in the system at right: Add the first two equations, and then add the second two equations. This produces two new equations. Find x, z, and y to complete the solution.		2014-08-12 15:49:37.369326	2015-01-23 16:54:34.495576	x + y + z = 2\r\nx - y + z = 6\r\n2x + 2z = 8\r\nx + y -3z = 0\r\nx - y + z = 6\r\n2x - 2z = 6\r\n2x + 2z = 8\r\n4x = 14\r\nx = 7/2\r\n14/2 - 2z = 12/2\r\n2z = 1\r\nz = 1/2\r\n7/2 + y + 1/2 = 2\r\ny + 4 = 2\r\ny = -2\r\ncheck: 7/2 - -2 + 1/2 = 6\r\n4 + 2 = 6	PBL_graph_56_6.PNG	\N	(3.5,-2,0.5)	Matt K.	Shantanu	1
548	2	57	If possible, find values for x and y for which\r\n(a) |x + y| < |x| + |y| (b) |x + y| = |x| + |y| (c) |x| + |y| < |x + y|\r\nWrite two conjectures about the relative values of |x| + |y| and |x + y|.		2014-08-12 16:12:56.615346	2015-01-28 18:52:21.464559	(a) |x + y| < |x| + |y|,  (1, -1), (-2, 4), the numbers need to have opposite signs\r\n(b) |x + y| = |x| + |y|,  (0, 0), (1, 1), etc., true if both numbers have the same sign\r\n(c) |x| + |y| < |x + y|, can't be satisfied, as if the numbers have the same signs they will be equal, and if they don't |x + y| can only be smaller.\r\n	\N	\N	a) opposite signs  b) same sign   c) not possible	Zach		1
543	4	56	You are buying some cans of juice and some cans of soda for the dorm. The juice is $0.60 per can while the soda is $0.75. You have $24 of dorm funds, all to be spent.\r\n(a) Write an equation that represents all the different combinations of juice and soda you can buy for $24.\r\n(b) Is it possible to buy exactly 24 cans of juice and spend the remainder on soda? Explain.\r\n(c) How many different combinations of drinks are possible?		2014-08-12 15:27:13.717782	2015-01-23 16:45:45.548996	a) .6j + .75s = 24\r\nb) 14.40 on juice leaves 9.60 for soda. 9.80/.75 is 12.8 cans, so no, since you can't buy a partial can.\r\nc) 60j + 75s = 2400\r\n   60j = 2400 - 75s\r\n     j = 40 - 5s/4 \r\nStarting at (0,40),(4,35),(8,30),(12,25),(16,20),(20,15),(24,10),(28,5),(32,0), nine points total\r\nSince 5 doesn't go into 4 evenly there can't be any other points.\r\n	\N	PBL_ans_56_4.PNG	a) .6j + .75s = 24, b) no  c) 9 combinations	Scott	Tori, Matt	1
547	1	57	Rewrite each of the following polynomials as a product of two factors. One of the factors should be the greatest common monomial factor.\r\n(a) 24x^2 + 48x + 72 (b) πr^2 + πre (c) 7m − 14m^2 + 21m^3		2014-08-12 16:06:52.314997	2015-01-28 18:46:38.805284	(a) 24x² + 48x + 72    -> 24(x² + 2x + 3)  \r\n(b) πr² + πre         -> πr(r + e)\r\n(c) 7m − 14m² + 21m³  -> 7m(1 - 2m + 3m²)	\N	\N	a) 24(x² + 2x + 3  b) πr(r + e)  c) 7m(1 - 2m + 3m²)	Scott	Nicole	1
537	8	55	A catering company offers three monthly meal contracts: \r\nContract A costs a flat fee of $480 per month for 90 meals;\r\nContract B costs $200 per month plus $4 per meal;\r\nContract C costs a straight $8 per meal.\r\nIf you expect to eat only 56 of the available meals in a month, which contract would be best for you? When might someone prefer contract A? contract B? contract C?		2014-08-12 05:18:48.391205	2015-01-20 19:13:26.586568	56 meals would cost $480 under contract A, $424 under contract B, and $448 under contract C. Contract B is the best option for 56 meals.\r\nIf you thought that you might end up eating significantly more meals than 56, you might opt for Contract A so you would know your maximum cost beforehand.\r\nIf you thought that 56 was the maximum, and it might end up less, you might opt for Contract C as it is cheaper if you end up eating 52 meals or less.  	\N	PBL_ans_55_8.PNG	B is best, C if fewer than 50, A if greater than 70 meals	Zach	Henry	1
538	9	55	Graph the equation |x + y| = 1. Shade the region described by |x + y| ≤ 1.		2014-08-12 05:28:27.041395	2015-01-20 19:16:41.281603	attached	\N	PBL_ans_55_9a.PNG	attached	Alex	Julia, Caroline	1
561	6	58	Pat and Kim are in the habit of taking a morning coffee break in Grill. Each of them arrives at a random time between 9 am and 10 am, and stays for exactly ten minutes.\r\n(a) If Kim arrives at Grill at 9:37 tomorrow, what arrival times for Pat allow the two to see each other during their breaks?\r\n(b) Suppose that Pat and Kim arrive at p minutes and k minutes after 9 am, respectively. Find values for p and k that signify that one person is arriving just as the other is leaving.\r\n(c) Shade those points (p, k) in the coordinate plane that signify that Pat and Kim see each other at some time during their breaks.		2014-08-13 06:42:05.166801	2015-01-29 15:03:56.560505	a) 9:27 to 9:47\r\nb) |k-p| = 10\r\nc) k-p = 10 or p-k = 10\r\n   k = p + 10 or k = p - 10	\N	PBL_ans_58_6.PNG	a) 9:27 to 9:47  b) |k-p| = 10  c) |k-p| <= 10	Matt V.	Ben	1
552	6	57	Refer to the diagram at right, which shows a large square that has been subdivided into two squares and two rectangles. Write formulas for the areas of these four pieces, using the dimensions a and b marked on the diagram. Then write an equation that states that the area of the large square is equal to the combined area of its four pieces. Do you recognize this equation?		2014-08-12 17:50:11.405547	2015-01-28 19:07:42.042226	a^2, ab, ab, b^2  -> total area is a^2 + 2ab + b^2 = (a+b)^2\r\nYes, it is a perfect square like (x+1)^2	PBL_graph_57_6.PNG	\N	(a + b)^2, perfect square	Alex 	Shantanu, Matt	1
554	8	57	Find the equations of at least three lines that intersect each other at the point (6,−2).		2014-08-12 18:33:58.545333	2015-01-28 19:13:15.949694	(y + 2) = (x - 6)\r\n(y + 2) = 2(x - 6)\r\n(y + 2) = -3(x - 6)	\N	PBL_ans_57_8.PNG	(y + 2) = m(x - 6), etc.by varying the slope	Suzana	Henry, Hannah	1
555	9	57	Driving along Route 108 one day, a math teacher reached the railroad crossing in Newmarket at exactly the same time as a long freight train. While waiting patiently for the caboose to finally arrive and pass, the teacher decided to estimate the length of the train, which seemed to be moving at about 10 miles per hour. Given that it was a five-minute wait, how many feet did the teacher estimate the length of the train to be?		2014-08-12 18:36:50.715373	2015-01-26 17:23:51.640526	10 * 5/60 = 50/60 or about 5/6 of a mile. 5280*5/6 = about 4400 feet.	\N	\N	4400 feet		Caroline	1
559	4	58	(Continuation) The economics of tourist trinkets is volatile. In August, Robin found that the seagull profit had dipped to $4, while the lobster profit had soared to $5.\r\n(a) Is it now possible for Robin to make a profit of $55 per day?\r\n(b) What is the greatest profit Robin can make in one day?		2014-08-13 06:15:32.225922	2015-02-02 18:48:25.418387	a) Yes, Robin can make $55 in one day, 7 lobsters bring in $35 and 5 seagulls bring in $20.\r\nb) Making 10 lobsters and 2 seagulls produces the maximum profit, 50 + 8, $58.	\N	\N	a) yes (7,5)  b) (10,2) makes $58	Avery	Jared, Tori	1
550	4	57	To make a little spending money, Taylor decided to sell special souvenir programs for the Exeter-Andover wrestling match. The printing cost was $0.32 per program, and they were priced at $0.50 each. Taylor sold all but 50 of the programs, and made a small profit of $11. How many programs were printed?		2014-08-12 17:19:58.809101	2015-01-28 19:03:25.127912	50(n-50) - 32n = 1100\r\n50n - 2500 - 32n = 1100\r\n18n = 3600\r\nn = 200 programs printed\r\ncheck: 150*.5 - 200*.32 = 75 - 64 = 11	\N	\N	200 programs	Matt K.	Liam, Matt	1
551	5	57	Chet has at most 20 hours a week available to work during the summer, dividing that time between making $3 an hour babysitting and $7 an hour working for a landscaping company. Chet needs to accumulate at least $84 per week.\r\n(a) Write a system of inequalities that describes the given conditions.\r\n(b) What are the most hours Chet can work babysitting and still earn at least $84?		2014-08-12 17:45:39.779508	2015-01-28 19:06:20.249773	a) b + l <= 20  ->   l < 20 - b\r\n  3b + 7l > 84  ->   7l > 84 - 3b  -> l > 12 - 3b/7\r\nb) 14 hours, 14*3 + 6*7 = 84\r\n	\N	PBL_ans_57_5.PNG	a) b + l <= 20, 3b + 7l >= 84  b) 14	Jaden	Ben, Tori	1
560	5	58	Factor the following: (a) 2x² − 4x (b) x² + 24x + 144 (c) x² + 3x		2014-08-13 06:18:53.200202	2015-02-02 18:50:00.39739	(a) 2x² − 4x         ->  2x(2x - 2)\r\n(b) x² + 24x + 144   ->  (x+12)²\r\n(c) x² + 3x          ->  x(x + 3)	\N	\N	a) 2x(x - 2)  b) (x+12)²   c) x(x + 3)	Suzana	Matt, Shantanu	1
553	7	57	Find coordinates for the point where the line 3x−2y = 3001 intersects the line 4x − 3y = 4001. First solve the problem without using your calculator, then confirm your answer using your calculator.		2014-08-12 18:19:41.829672	2015-01-28 19:11:14.272437	   3x − 2y = 3001\r\n   4x − 3y = 4001\r\nx3 9x - 6y = 9003\r\nx2 8x - 6y = 8002\r\n-  x       = 1001\r\n  3003 - 2y = 3001\r\n  2y = 2\r\n   y = 1\r\ncheck: 4004 - 3 = 4001, 3003 - 2  = 3001\r\n	\N	PBL_ans_57_7.PNG	(1001, 1)	Miranda	Sam	1
556	1	58	Find coordinates for the point of intersection of the lines px+y = 1 and 3px+2y = 4.\r\nYou will have to express your answer in terms of p.		2014-08-12 18:41:29.653771	2015-01-29 14:51:13.749708	    px +  y = 1\r\n   3px + 2y = 4\r\nx2 2px + 2y = 2\r\n   3px + 2y = 4\r\n-  -px = -2\r\n    px = 2\r\n     x = 2/p\r\n    p*2/p + y = 1\r\n     2 + y = 1\r\n         y = -1    the intersection point is (2/p, -1)\r\ncheck: 6 - 2 = 4\r\n	\N	\N	(2/p, -1)	Maya	Caroline	1
558	3	58	(Continuation) Can Robin make a profit of $70 in one day? What combination of seagulls and lobsters produces the greatest daily profit? What is this maximum profit?		2014-08-13 06:10:59.142296	2015-01-29 15:00:05.916843	She can't make $70 profit since she can make a maximum of 9 seagulls at $6 for $54. The three remaining lobsters can only bring in $12. No other combination can make more since she is limited to a maximum of 12 carvings.\r\n9 seagulls and 3 lobsters produces the largest profit, $66.	\N	\N	no, (9,3), $66	Miranda	Liam	1
617	8	65	Taylor has enough money to buy either 90 granola bars or 78 pop-tarts. After returning from the store, Taylor has no money, 75 granola bars, and p pop-tarts. Assuming that Taylor has not yet eaten anything, figure out what p is.		2014-08-16 03:36:55.963665	2015-02-13 18:42:26.648555	78p = 90g\r\np = 90g/78\r\nThe price of a pop tart is 90/78 the price of a granola bar, they cost more.\r\nSo instead of 15 granola bars he could have bought fewer pop tarts.\r\np/78 = 90/15 -> # of pop tarts/max # could buy = 90 granola\r\np = (78/90) * 15 or 15p = 90/78\r\np = 13\r\ncheck: 75 + 13*90/78 = 90\r\n\r\n 	\N	\N	13 pop tarts	Lucia	Shantanu	1
567	5	59	(Continuation) In the following, choose k to create a perfect-square trinomial:\r\n(a) x^2 − 16x + k (b) x^2 + 10x + k (c) x^2 − 5x + k		2014-08-13 16:00:53.546125	2015-02-02 16:52:24.658364	(a) x^2 − 16x + k  ->   k = 64, (x - 8)^2\r\n(b) x^2 + 10x + k  ->   k = 25, (x - 5)^2   \r\n(c) x^2 − 5x + k   ->   k = 6.25, (x - 2.5)^2  	\N	\N	a) 64   b)  25  c)  6.25	Scott	Sam	1
569	7	59	There are 55 ways to make x♡x♢x♣ = x^12 an identity, by assigning positive integers to the heart, diamond, and club. Find four of them.		2014-08-13 17:34:50.521737	2015-02-02 16:55:28.1259	x^4*x^4*x^4\r\nx^3*x^4*x^6\r\nx^2*x^4*x^7\r\nx^1*x^1*x^10	\N	\N	various	Avery		1
563	1	59	Cameron bought some 39-cent, 24-cent, and 13-cent stamps at the Post Office. The 100 stamps cost $33.40, and there were twice as many 24-cent stamps in the sale as there were 13-cent stamps. How many stamps of each denomination did Cameron buy?		2014-08-13 07:12:05.587393	2015-01-30 15:15:05.125528	39b + 24m + 13s = 33.40\r\n      b + m + s = 100\r\n              m = 2s\r\n39b + 48s + 13s = 3340\r\n     b + 2s + s = 100\r\n39b + 61s = 3340\r\n  b + 3s = 100\r\n   39b + 61s = 3340\r\n-  39b + 117s = 3900\r\n         -56s = -560\r\n            s = 10\r\n            m = 20\r\n            b = 70\r\ncheck: 70*.39+20*.24+10*.13 = 27.30 + 4.80 + 1.30 = 33.40\r\n     b = 	\N	\N	 10 @.13, 20 @ .24, 70 @ .39	Matt K.	Henry	1
570	8	59	According to the US Census Bureau, the population of the USA has a net gain of 1 person every 14 seconds. How many additional persons does that amount to in one year?		2014-08-13 17:38:42.418989	2015-02-02 16:57:48.722281	60/14 -> 4.28 per minute -> 257.14 per hour -> 6161.43 per day ->  2,254,114 per year.\r\n             x60               x60                  x24             x365.25	\N	\N	2252581.4 for 365 days, 2,254,114 for 365.25	Avery	Nicole	1
576	4	60	It would take Tom 8 hours to whitewash the fence in the backyard. His friend Huck would need 12 hours to do the same job by himself. They both start work at 9 in the morning, each at opposite ends of the fence, under the watchful eye of Tom’s Aunt Polly. At what time in the afternoon is the task complete?		2014-08-14 03:44:42.584822	2015-02-04 16:51:09.368884	t/8 + t/12 = 1\r\n3t/24 + 2t/24 = 1\r\n5t = 24\r\nt = 24/5 or 4.8 hours to finish the job, it is finished at 1:48 p.m.\r\ncheck: 24/5*8 + 24/5*5 = .6 + .4 = 100% finished	\N	\N	1:48 p.m.	Matt K.	Sam, Matt	1
566	4	59	Factor the following 'perfect-square trinomials':\r\n(a) x^2 − 12x + 36 (b) x^2 + 14x + 49 (c) x*2 − 20x + 100\r\nAs suggested, these should all look like either (x − r)² or (x + r)². State the important\r\nconnection between the coefficients of the given trinomials and the values you found for r.		2014-08-13 15:56:58.437131	2015-02-02 16:50:07.026815	(a) x^2 − 12x + 36    ->  (x - 6)²\r\n(b) x^2 + 14x + 49    ->  (x + 7)²  \r\n(c) x*2 − 20x + 100   ->  (x - 10)²\r\nthe middle coefficient is 2r and the third is r²\r\n	\N	\N	a) (x - 6)²  b) (x + 7)²   c) (x - 10)²  d) 2nd coefficient is 2r, 3rd is r²	Matt V.	Hannah	1
571	9	59	Find three consecutive odd numbers whose sum is 627.		2014-08-13 17:41:10.020595	2015-02-02 16:58:55.854028	x-2 + x + x + 2 = 627\r\n3x = 627\r\n207,209,211\r\ncheck: 207+209+211= 627	\N	\N	207,209,211	Lucia	Hannah, Jared, Julia	1
573	1	60	The distance from here to the beach at Little Boar’s Head is 10 miles. If you walked there at 4 mph and returned jogging at 8 mph, how much time would the round trip take?\r\nWhat would your overall average speed be?		2014-08-13 18:02:59.136101	2015-02-02 17:17:10.906656	10/4 + 10/8 = 2.5 + 1.25 = 3.75 hours\r\nAverage speed: 3.75/20 = 5.333 mph	\N	\N	3 3/4 hours, 5 1/3 mph	Jason	Caroline	1
574	2	60	The diagram at right shows a rectangle that has been cut into eleven square pieces, no two being the same size. Given that the smallest piece is 9 cm by 9 cm, figure out the sizes of the other ten pieces. The original rectangle also looks like it could be square. Is it?		2014-08-13 18:54:20.894148	2015-02-02 16:15:12.217249	It isn't a square, it's 176 by 177	PBL_graph_60_2.PNG	PBL_ans_60_2.PNG	9,16,21,25,34,41,43,57,77,78,99   176 x 177		Liam, Sam	1
615	6	65	Perform the indicated operations, and record your observations:\r\n(a) √2 · √18 \r\n(b) √8 · √8 \r\n(c) 2√5 · 3√20\r\nSuggest a rule for multiplying numbers in the form √a · √b. Extend your rule to problems in the form of p√a · q√b.		2014-08-15 20:51:38.985068	2015-02-13 18:39:51.334107	(a) √2 · √18      -> √36 = 6\r\n(b) √8 · √8       -> √64 = 8\r\n(c) 2√5 · 3√20    -> 6 * √100 = 60\r\n√a · √b = √ab\r\np√a · q√b = pq√ab\r\n	\N	\N	a) 6  b) 8  c) 60   pq√ab	Avery		1
564	2	59	Given the equation 3x + y = 6, write a second equation that, together with the first, will create a system of equations that\r\n(a) has one solution;\r\n(b) has an infinite number of solutions;\r\n(c) has no solution;\r\n(d) has the ordered pair (4, −6) as its only solution.		2014-08-13 15:46:11.200215	2015-01-30 15:18:30.367069	a) y = x\r\nb) 6x + 2y = 12\r\nc) 3x + y = 10\r\nd) (y + 6) = (x - 4)  ->  y = x - 10	\N	PBL_ans_59_2.PNG	a) various  b) 3x + y = 6 or multiples  c) parallel  d) many	Maya	Hannah	1
568	6	59	In each of the following, find the correct value for ∇:\r\n(a) y4y7 = y∇ \r\n(b) y12y∇ = y36 \r\n(c) y4y4y4y4 = y∇ \r\n(d) (y∇)3 = y27		2014-08-13 16:04:22.501259	2015-02-02 16:54:12.127818	(a) y4y7 = y∇      ->  y^11\r\n(b) y12y∇ = y36    ->  y^24\r\n(c) y4y4y4y4 = y∇  ->  y^16\r\n(d) (y∇)3 = y27    ->  y^9	\N	\N	a) y^11  b) y^24  c) y^16   d) y^9	Matt K.	Hannah	1
572	10	59	Graph y = 2/3|x − 5| − 3.\r\n(a) What are the coordinates of the vertex of this graph?\r\n(b) Find the coordinates of all axis intercepts of the graph.\r\n(c) Using each of these points and the vertex, compute the slope of each side of the graph.\r\nHow are these slopes related?		2014-08-13 17:56:32.508496	2015-02-02 17:09:13.465149	a) attached\r\nb) y = 2/3|x − 5| − 3\r\n  2/3|x - 5| = 3|\r\n     |x - 5| = 9/2\r\nx - 5 = 9/2 or |x - 5| = -9/2\r\n    x = 19/2 or x = 1/2\r\n    y = 2/3|-5| - 3\r\n    y = 10/3 - 9/3\r\n    y = 1/3\r\nx intercepts(1/2,0) and (19/2,0)   y intercept = (0,1/3)  vertex(5,-3)\r\nc) slope 1 = 1/3/-1/2  ->  -2/3\r\n   slope 2 = 3/9/2 ->  6/9 -> 2/3\r\nTheir absolute values are the same.	\N	PBL_ans_59_10.PNG	a) (5,-3)  b) x ints (1/2,0), (19/2,0)   y int (0,1/3)  c) 2/3 and -2/3	Miranda, Lucia	Ben	1
575	3	60	Given that three shirts cost d dollars,\r\n(a) How many dollars does one shirt cost?\r\n(b) How many dollars do k shirts cost?\r\n(c) How many shirts can be bought with q quarters?		2014-08-14 03:35:19.466827	2015-02-04 16:46:04.34008	a) 1 shirt = d/3\r\nb) kd/3\r\nc) d/3/q/4 = 4q/3d 	\N	\N	a) d/3 b) kd/3 c) 3q/4d 	Matt V.	Tori	1
582	2	61	What happens if you try to find an intersection point for the linear graphs 3x−2y = 10 and 3x − 2y = −6? What does this mean?		2014-08-14 05:06:22.651799	2015-02-04 17:21:32.023105	Both x and y disappear when you combine the equations. Because they have the same slope and different y intercepts, the lines are parallel and don't have a solution.	\N	\N	No intersection, lines parallel	Alex	Hannah	1
587	7	61	(Continuation) Because oak is heavier than pine, the costs of packing and shipping are $25 for an oak bookcase and only $15 for a pine bookcase.\r\n(a) What combination of bookcases will cost a total of $700 to pack and ship?\r\n(b) Can the packing and shipping costs be reduced to $450?\r\n(c) What combination of bookcases will make the packing and shipping costs as small as possible?		2014-08-14 23:29:29.951127	2015-02-05 19:02:42.460857	25o + 15p = 700\r\nif o = 7, 15p = 525/15 = 35\r\ncheck 7*25 + 35*15 = 175 + 525 = 700\r\n5o + 25p = 125 + 375 = 500, so no, since that's the minimum shipping cost under the rules.\r\n5 oak and 25 pine would have the minimum shipping cost.	\N	\N	a) 7,35 10,30  13,25  16,20  b) no  c) 5 oak, 25 pine	Lucia	Liam	1
584	4	61	Evaluate 6−4/2+2 · 5 and then check using your calculator. Show how the insertion of parentheses can make the value of the expression equal to (a) 1 (b) −14 (c) 25		2014-08-14 05:23:20.872162	2015-02-05 18:51:20.376537	Calculator gives 14\r\n6−(4/(2+2)) · 5) = 1\r\n6−((4/2)+2) · 5 = -14\r\n(6−4/(2+2)) · 5 = 25	\N	\N	a) 6−(4/(2+2)) · 5) = 1  b) 6−((4/2)+2 · 5) = -14  c) (6−4/(2+2)) · 5 = 25	Lucia	Ben	1
586	6	61	The Exeter Bookcase Company makes two types of bookcase, pine and oak. The EBC produces at least 30 but no more than 45 bookcases each week. They always build more pine bookcases than oak and they make at least five oak bookcases per week Let x and y denote the weekly production of oak bookcases and pine bookcases, respectively, and write a system of inequalities that models this situation. Graph the inequalities and shade the feasible region. Given that x and y are discrete variables, are all the shaded points meaningful?		2014-08-14 23:20:14.691266	2015-02-05 18:57:02.751396	30 <= x + y <= 45\r\ny > x\r\nx >= 5\r\nOnly the lattice points where x and y are integers are meaningful in this context.\r\n	\N	PBL_ans_61_6.PNG	see graph	Lucia	Ben	1
578	6	60	Ten cc of a solution of acid and water is 30% acid. I wish to dilute the acid in the mixture by adding water to make a mixture that is only 6% acid. How much pure water must I add to accomplish this?		2014-08-14 04:44:44.154818	2015-02-04 17:02:41.900976	3/(7+3+w) = .06\r\n3 = .06(10+w)\r\n.6 + .06w = 3\r\n.06w = 2.4\r\n   w = 40, add 40 cc. of pure water\r\ncheck: 3/(47+3) = .06\r\n\r\n	\N	\N	40 cc	Avery	Simon, Shantanu	1
588	8	61	Pat and Kim are having an algebra argument. Kim is sure that −x^2 is equivalent to (−x)^2, but Pat thinks otherwise. How would you resolve this disagreement? What evidence does your calculator offer?		2014-08-14 23:38:04.235474	2015-02-05 19:05:25.174306	With the parentheses it's clear that we are multiplying -x * -x, so the answer is positive. But without the parentheses we can interpret this as the calculator does, as -1*x^2, which is negative. So if in doubt, use parentheses to clarify.	\N	\N	Depends on how you interpret the - sign	Jaden	Sam	1
580	8	60	What are the dimensions of a square that encloses the same area as a rectangle that is two miles long and one mile wide? Answer to the nearest inch, please.		2014-08-14 04:56:14.356469	2015-02-04 17:15:09.144077	Rectangle is 2 square miles, so the square would be the square root of 2 on a side, or about 1.414 miles on a side.\r\nRoot 2 * 5280 * 12 = ~89604.57 inches per side.	\N	\N	89604.5 inches or 7467 ft 1 inch	Maya	Liam	1
589	9	61	Given that Brett can wash d dishes in h hours, write expressions for\r\n(a) the number of hours it takes for Brett to wash p dishes;\r\n(b) the number of dishes Brett can wash in y hours;\r\n(c) the number of dishes Brett can wash in m minutes.		2014-08-14 23:43:48.803758	2015-02-05 19:12:26.582339	a) (p/d)*h\r\nb) d * (y/h)\r\nc) (d*((m/60)/h)	\N	\N	a) ph/d  b)  dy/h  c) dm/(60h)	Suzana	Henry, Matt	1
590	1	62	What is the value of 5^7/5^7 ? of 8^3/8^3 ? of c^12/c^12 ? What is the value of any number divided by itself? If you apply the common-base rule dealing with exponents and division, 5^7/5^7 should equal 5 raised to what power? and c^12/c^12 should equal c raised to what power? It therefore makes sense to define c^0 to be what?		2014-08-14 23:48:05.042927	2015-02-05 19:13:03.427787	1,1,1\r\n1\r\n5^7/5^7 = 5^0\r\nc^12/c^12 = c^0\r\nc^0 = 1\r\n	\N	\N	1,1,1,1  the 0th power, same,  c^0 = 1	Zach	Hannah, Julia	1
583	3	61	A jeweler has 10 ounces of an alloy that is 50% gold. How much more pure gold does the jeweler need to add to this alloy, to increase the percentage of gold to 60%?		2014-08-14 05:11:02.855436	2015-02-05 18:39:24.337086	(5+g)/(10+g) = .6\r\n5+g = 6 + .6g\r\n.4g = 1\r\n g = 2.5 ounces need to be added\r\ncheck 7.5/12.5 = .6	\N	\N	2.5 oz.	Matt V, Miranda	Sam, Jared	1
585	5	61	When an object falls, it gains speed. Thus the number of feet d the object has fallen is not linearly related to the number of seconds t spent falling. In fact, for objects falling near the surface of the Earth, with negligible resistance from the air, d = 16t². How many seconds would it take for a cannonball to reach the ground if it were dropped from the top of the Eiffel Tower, which is 984 feet tall? How many seconds would it take for the cannonball to reach the ground if it were dropped from a point that is halfway to the top?		2014-08-14 23:00:06.882859	2015-02-05 18:53:18.467048	16t² = 982\r\nt² = 61.375\r\nt = ~7.8 seconds\r\n16t² = 491\r\nt² = 30.6875\r\nt = ~5.5 seconds\r\n	\N	\N	7.84   5.55  seconds	Matt K.	Jared	1
579	7	60	Corey is out on the roads doing a long run, and also doing some mental calculations at the same time. Corey’s pace is 3 strides per second, and each stride covers 5 feet.\r\n(a) How much time does it take Corey to cover a mile?\r\n(b) If Corey’s stride increased to 5.5 feet per step, how much time would be needed to cover a mile?\r\n(c) At five feet per step, how many steps would Corey need to run the marathon distance, which is 26 miles and 385 yards?		2014-08-14 04:52:07.935944	2015-02-03 17:06:27.172488	a) 3*5 = 15 feet per second, 5280/15 = 352 seconds or 5 minutes and 52 seconds.\r\nb) 5280/16.5 = 320 seconds, or 5 minutes and 20 seconds\r\nc) 26 miles = 137,280 feet + 3 * 385 = 138435 feet. divided by 5 = 27687 steps	\N	\N	a) 5 min 52 sec.   b)  5 min 20 sec  c) 27,687 steps		Nicole, Hannah	1
595	2	63	Complete the table at right. Then graph by hand both y = |x| and y = x², on the same system of axes. Check your graphs with your calculator. In what respects are the two graphs similar? In what respects do the two graphs differ? 		2014-08-15 04:01:54.350316	2015-02-09 14:48:23.192342	similarities: same vertex, open up,pass through (–1,1) and (1,1); symmetric; \r\ndifferences: straight line vs curved, x² rises slower to (1,1) and faster after \r\n x   |x|   x^2\r\n -2    2     4\r\n -1    1     1\r\n  0    0     0\r\n  1    1     1\r\n  2    2     4\r\nThe graphs are similar in area where x is close to 0, but they differ greatly as x increases.	PBL_graph_63_2.PNG	PBL_ans_63_2.PNG	similarities: same vertex, open up, pass through (–1,1) and (1,1); symmetric; differences: straight line vs curved, x2 rises slower to (1,1) and faster after	Suzana		1
598	5	63	A box with a square base and rectangular sides is to be 2 feet and 6 inches high, and to contain 25.6 cubic feet. What is the length of one edge of the square base?	Simple quadratic - 2.6x² = 25.6	2014-08-15 04:22:08.664123	2015-02-10 16:56:27.345047	sq.rt. of (25.6 / 2.5) = 3.2 feet\r\ncheck: 4.81 * 4.81 * 2.5 = 25.6	\N	\N	3.2 feet	Miranda	Caroline, Matt, Ben	1
599	6	63	Equations such as A = 40x − x² and h = 300 − 16t² define 'quadratic functions'. The word 'function' means that assigning a value to one of the variables (x or t) determines a 'unique' value for the other (A or h). It is customary to say that “A is a function of x.” In this example, however, it would be incorrect to say that “x is a function of A.” Explain.		2014-08-15 04:28:25.913123	2015-02-10 16:56:38.54987	A given x would determine a unique value for A. It would not work the other way, as there might be more than one value of x possible for a given A. I.e., If A is 0, x could be 0, or x could be 40.	\N	\N	x could have more than one value for a given A	Avery	Tori	1
593	4	62	One morning, Ryan remembered lending a friend a bicycle. After breakfast, Ryan walked over to the friend’s house at 3 miles per hour, and rode the bike back home at 7 miles per hour, using the same route both ways. The round trip took 1.75 hours. What distance did Ryan walk?		2014-08-15 00:28:20.724903	2015-02-10 15:46:08.855669	d/3 + d/7 = 1.75\r\n7d/21 + 3d/21 = 1.75\r\n10d/21 = 1.75\r\n10d =  36.75\r\n3.675 miles was the distance Ryan walked, which took a little over an hour.\r\ncheck: 3.675/3 + 3.675/7 = 1.225 + 0.525 = 1.75	\N	\N	3.675 mi	Jason	Liam	1
602	9	63	Water pressure varies directly with the depth of submersion. Given that a diver experiences approximately 58.9 pounds per square inch of pressure at a depth of 100 feet, what pressure will a submarine encounter when it is one mile below the surface of the Atlantic Ocean?		2014-08-15 04:41:29.196824	2015-02-10 17:14:13.833236	52.8*58.9 = 3115.2 psi	\N	\N	3104.64 psi	Matt V., Alex	Benji	1
600	7	63	The graph of a quadratic function is called a 'parabola'. This shape is common to all graphs of equations of the form y = ax² + bx + c, where a is nonzero. Confirm this by comparing the graph of y = x², the graph of y = 40x−x² and the graph of y = 300−16x². How are the three graphs alike, and how are they different? Find numbers xmin, xmax, ymin, and ymax, so that the significant features of all three graphs fit in the window described by xmin ≤ x ≤ xmax and ymin ≤ y ≤ ymax.		2014-08-15 04:37:53.533844	2015-02-10 16:14:26.61171	The 3 graphs all have the same basic shape. They point in different directions, and some are less flat than others.\r\nx-min = -25, x-max = 40, y-min = -100, y-max = 500	\N	PBL_ans_63_7.PNG	similar shape, one vertex, etc., point different ways, wider/narrower		Hannah	1
596	3	63	Taylor starts a trip to the mall with $160 cash. After 20% of it is spent, seven-eighths of the remainder is lost to a pickpocket. This leaves Taylor with how much money?		2014-08-15 04:03:40.75804	2015-02-09 14:49:24.203676	160*.8 = 128 \r\n128/8 = $16	\N	\N	$16	Lucia	Julia, Simon	1
594	1	63	Write the following monomials without using parentheses:\r\n(a) (ab)² (ab²) (b) (−2xy^4)(4x²y³) (c) (−w^3x²)(−3w) (d) (7p^2q^3r) (7pqr^4)²		2014-08-15 00:39:12.606598	2015-02-09 14:46:16.423578	(a) (ab)² (ab²)         -> ab*ab*a*b*b = a³*b^4\r\n(b) (−2xy^4)(4x^2y^3)     -> -8*x^3*y^7\r\n(c) (−w^3x²)(−3w)        -> 3*w^4*x²\r\n(d) (7p^2q^3r) (7pqr^4)² -> (7p^2q^3r)(7pqr^4)(7pqr^4)  ->  343*p^5*q^5*r^9	\N	\N	a) a³*b^4  b -8x^3 y^7  c) 3w^4 x²  d)  343p^5 q^5 r^9	Matt K.	Hannah	1
601	8	63	Give two examples of linear functions. Why are they called linear?\r\n		2014-08-15 04:39:08.251119	2015-02-10 17:11:22.33254	y = x - 3\r\ny = 3x\r\nThey are called linear because all the pairs of points will line on the same line.	\N	\N	Form a straight line	Scott	Hannah, Jarod	1
597	4	63	A worker accidentally drops a hammer from the scaffolding of a tall building. The worker is 300 feet above the ground. As you answer the following, recall that an object falls 16t² feet in t seconds (assuming negligible air resistance). \r\n(a) How far above the ground is the hammer after falling for one second? for two seconds? Write a formula that expresses the height h of the hammer after it has fallen for t seconds.\r\n(b) How many seconds does it take the hammer to reach the ground? How many seconds does it take for the hammer to fall until it is 100 feet above the ground?\r\n(c) By plotting some data points and connecting the dots, sketch a graph of h versus t. Notice that your graph is not a picture of the path followed by the falling hammer.		2014-08-15 04:17:45.995465	2015-02-10 16:47:02.385104	a) After 1 second: 300 - 16(1²) ->  284\r\n   After 2 seconds: 300 - 16(2²) -> 236\r\n   h = 300 - 16(t²)\r\nb) 0 = 300 - 16(t²)  ->  300 = 16t²   t² = 300/16   t = 4.33 seconds\r\n  100 = 300 - 16(t²) ->  200 = 16²    t² = 12.5     t = 3.54 seconds\r\nc) \r\n	\N	PBL_ans_63_3.PNG	a) 284, 236 h = 300 - 16t²  b) 4.33 sec, 3.54 sec  c) graph	Lucia	Nicole	1
608	6	64	You have seen a demonstration that √2 is irrational. Give a similar demonstration that √3 is irrational.		2014-08-15 15:47:07.317786	2015-02-11 17:21:06.559608	Assume √3 = r/p reduced to lowest terms.\r\nSquare both sides,            3 = r²/p²\r\nMultiply both sides by q^2    3p^2 = r²,   \r\nr must have 3 as a factor, since 3*p*p = r*r, and 3 is prime, so r*r cannot produce 3.\r\nr² must have 9 as a factor\r\np must have 3 as a factor\r\nThus the fraction can't be in lowest terms.\r\n\r\n\r\n	\N	\N	Similar proof to √2		Caroline	1
607	5	64	When two rational numbers are multiplied together, their product is also a rational\r\nnumber. Explain. Is it necessarily true that the product of two irrational numbers is\r\nirrational? Explore this question by evaluating the following products.\r\n(a) √3 ·√27 \r\n(b) √2 · √6 · √3 \r\n(c) √6 · √12 \r\n(d) (√6)^3\r\n(e) √3 · (√3)^2		2014-08-15 15:34:22.062368	2015-02-12 17:03:14.323388	No, the product of two irrational numbers can be rational.\r\n(a) √3 ·√27       -> √3 · √3 ·√9 = 3 * 3 = 9\r\n(b) √2 · √6 · √3  -> √2 · √2 · √3 · √3 = 2 * 3 = 6\r\n(c) √6 · √12      -> √2 · √3 · √2 · √3  · √3 = 6 · √2\r\n(d) (√6)^3        -> √2 · √3 · √2 · √3 · √2 · √3 = 6 · √6\r\n(e) √3 · (√3)^2   -> 3 · √3	\N	\N	a) 9    b) 6    c) √72 or 6√2    d) √216 or 6√6    e) 3√3	Scott	Hannah	1
610	1	65	The manager of the Stratham Flower Shop is ordering potted lilies and tulips from a local wholesaler. Per pot, the lilies cost $3 and the tulips cost $2. Storage space at the shop requires that the order be no more than 120 pots total. The manager knows from previous experience that at least 30 of each type are needed, and that the number of lilies, L, should be at most two thirds of the number of tulips, T.\r\n(a) Sketch the feasible region that satisfies the above conditions. Put “lilies” on the vertical axis, and “tulips” on the horizontal axis.\r\n(b) The manager sells lilies for $5 a pot, and tulips for $3.50 a pot. Calculate the profit earned at each corner of the feasible region.		2014-08-15 16:20:16.746617	2015-02-13 14:59:53.781135	a) L + T <= 120\r\n   L >= 30\r\n   T >= 30\r\n   L <= 2T/3\r\nb) 45*1.5 + 30*2 = 127.50\r\n   72*1.5 + 48*2 = 204.00\r\n   90*1.5 + 30*2 = 195.00\r\n\r\n	\N	pbl_ans_65-1.PNG	$127.50 at 45,30   $204 at 72,48   $195 at 95,30	Avery	Sam, Ben	1
618	9	65	Avery and Sasha were comparing parabola graphs on their calculators. Avery had drawn y = 0.001x² in the window −1000 ≤ x ≤ 1000 and 0 ≤ y ≤ 1000, and Sasha had drawn y = x² in the window −k ≤ x ≤ k and 0 ≤ y ≤ k. Except for scale markings on the axes, the graphs looked exactly the same! What was the value of k?		2014-08-16 03:43:52.519756	2015-02-13 18:45:11.285486	1	\N	\N	k = 1	Lucia	Henry, Hannah	1
613	4	65	A Prep set out to bicycle from Exeter to the beach, a distance of 10 miles. After going a short while at 15 miles per hour, the bike developed a flat tire, and the trip had to be given up. The walk back to Exeter was made at a dejected 3 miles per hour. The whole episode took 48 minutes. How many miles from Exeter did the flat occur?	Similar: 62-4, 60-1, 45-1, 42-7	2014-08-15 20:30:01.30593	2015-02-13 18:33:49.820415	d/15 + d/3 = 4/5\r\n2d/30 + 10d/30 = 24/30\r\n12d = 24\r\nd = 24/12 or 2 miles\r\ncheck: 2/15 + 2/3 = 2/15 + 10/15 = 12/15 = 4/5 of an hour = 4*12 = 48 minutes	\N	\N	2 miles	Matt K. 		1
606	4	64	(Continuation) Find the x-intercepts of each of the following quadratic graphs:\r\n(a) y = x² + 4x (b) y = 2x² − 6x (c) y = 3x² − 15x (d) y = −2x² − 7x\r\nSummarize by describing how to find the x-intercepts of any quadratic graph y = ax²+bx.		2014-08-15 15:23:06.015026	2015-02-11 17:19:01.534899	(a) y = x² + 4x    ->  (0,-4)\r\n(b) y = 2x² − 6x   ->  (0, 3)\r\n(c) y = 3x² − 15x  ->  (0, 5)\r\n(d) y = −2x² − 7x  ->  (0, -7/2)\r\nOne of the x intercepts is 0, and the other is -b/a, which correspond to the factored values.\r\n	\N	\N	a) 0, -4  b) 0,3  c) 0,5  d) 0, -3.5		Tori. Hannah	1
612	3	65	There are several positive integers that leave a remainder of 12 when they are divided into 192. Find the smallest and the largest of those integers.		2014-08-15 20:14:44.368673	2015-02-13 19:02:00.140874	Must divide evenly into 180 and not 192\r\nFactors of 180 -> 2*2*3*3*5 -> 2,4,6, 12, 15, 18, 20, etc.\r\nFactors of 192 -> 2*2*2*2*2*2*3\r\n192/180 = 1r12\r\nAll factors of 180 can be looked at, but smallest has to be greater than 12, otherwise would divide further so 15 is it.	\N	\N	180 and 15	Jaden	Liam, Hanah	1
614	5	65	A car traveling at 60 miles per hour is covering how many feet in one second? A football field is 100 yards long. At 60 mph, how many seconds does it take to cover this distance? State your answer to the nearest tenth of a second.		2014-08-15 20:38:32.668187	2015-02-13 18:36:27.464976	60 mph is 1 mile, or 5280 feet per minute. 5280/60 is 88 feet per second.\r\n100 yards equals 300 feet.\r\n300/88 = 3.4 seconds to go 100 yards.	\N	\N	88 fps, 3.4 seconds	Suzana		1
605	3	64	(Continuation) The 'zero-product property' says that a · b = 0 is true if a = 0 or b = 0 is true, and only if a = 0 or b = 0 is true. Explain this property in your own words (looking up the word 'or' in the Reference section if necessary). Apply it to solve these equations:\r\n(a) x² + 4x = 0 (b) 2x² − 6x = 0 (c) 3x² − 15x = 0 (d) −2x² − 7x = 0		2014-08-15 15:08:30.031633	2015-02-10 16:26:05.917357	It means that when factoring, one of the two terms will be just some multiple x, without an added or subtracted number. If both a and b were zero there would just be some multiple of x^2.\r\n\r\n(a) x² + 4x = 0    ->  x(x+4) = 0 -> x = -4 or x = 0\r\n(b) 2x² − 6x = 0   ->  2x(x - 3) = 0 -> 2x = x -> x = 3 or x = 0\r\n(c) 3x² − 15x = 0  ->  3x(x - 5) = 0 -> 3x = 15 -> x = 5 or x = 0\r\n(d) −2x² − 7x = 0 ->   -x(2x + 7)  -> 2x = -7  ->  x = -2/7 or x = 0	\N	\N	a) 0, -4  b) 0,3  c) 0,5  d) 0, -3.5		Jullia, Nicole	1
611	2	65	Evaluate each of the following expressions by substituting s = 30 and t = −4.\r\n(a) t² + 5t + s (b) 2t²*s (c) 3t² − 6t − 2s (d) s − 0.5t²		2014-08-15 20:08:13.184152	2015-02-12 18:09:02.407725	(a) t² + 5t + s      ->  16 - 20 +30 = 26\r\n(b) 2t²*s            ->  32 * 30 = 960\r\n(c) 3t² − 6t − 2s    ->  48 +24 -60 = 12\r\n(d) s − 0.5t²        ->  30 - 8 = 22	\N	\N	a) 26  b)  960  c) 12   d)   22	Matt V.		1
624	6	66	Plot the points A = (4, 0), B = (4, 5), C = (0, 7), and D = (0, 0). Write a series of simultaneous inequalities that describe the region enclosed by the quadrilateral ABCD formed by joining the four points.		2014-08-16 19:19:35.325363	2015-02-19 15:04:59.076391	0<=x<=4\r\ny>=0\r\ny <= 7 - x/2\r\n	\N	PBL_ans_66_7.PNG	0<=x<=4,  y>=0,  y <= 7 - x/2	Matt K.	Henry, Shantanu, Jullia	1
625	7	66	The total area of six faces of a cube is 1000 sq cm. What is the length of one edge of the cube? Round your answer to three decimal places.		2014-08-16 19:23:37.336566	2015-02-19 15:05:55.094389	1000/6 = 166.667\r\nroot(166.667) = 12.910 cm	PBL_graph_66_7.PNG	\N	12.910 cm	Jaden	Nicole, Henry	1
642	1	69	The hot-water faucet takes four minutes to fill the tub, and the cold-water faucet takes three minutes for the same job. How long to fill the tub if both faucets are used?		2014-08-17 04:31:48.713817	2015-02-25 19:06:00.869373	t/3+t/4 = 1\r\n4t/12 + 3t/12 = 1\r\n7t = 12\r\nt = 12/7 or 1 5/7 minutes\r\ncheck:  (12/7)/3 + (12/7)/4 = 4/7+3/7 = 1	\N	\N	1 5/7 or 1.71 minutes	Lucia	Nicole, Shantanu, Sam	1
643	2	69	Find a quadratic equation for each of the graphs pictured at the right. Each curve has a designated point on it, and the y-intercepts are all at integer values. Also notice that the y-axis is the axis of symmetry for all.		2014-08-17 15:24:30.581926	2015-02-25 19:11:15.834932	2 = 1² + 1  -> y = x² + 1\r\n2 = 2²      -> y = x²/2\r\n-3 = 1² - 2 -> y = -x² - 2	PBL_graph_69_2.PNG	PBL_ans_69_2.PNG	top y = x² + 1, middle y = x²/2, bottom y = -x² - 2	Scott	Caroline, Julia	1
626	8	66	On a recent drive from Exeter to New York City, Taylor maintained an average speed of 50 mph for the first four hours, but could only average 30 mph for the final hour, because of road construction. What was Taylor’s average speed for the whole trip? What would the average have been if Taylor had traveled h hours at 30 mph and 4h hours at 50 mph?		2014-08-16 19:27:29.903078	2015-02-19 15:07:43.967915	(4*50 + 1*30)/5 = 46 mph\r\n(4h*50 + h*30)/h = (200h + 30h)/5h = 230/5 = 46 mph	\N	\N	46 mph, 46 mph	*Jason	Henry, Ben	1
622	4	66	(Continuation) To find the length of the shot without a calculator, you must set y equal to 0 and solve for x. Explain why, and show how to arrive at x² − 250x = 5000. \r\n(a) The next step in the solution process is to add 125² to both sides of this equation. Why was this number chosen?\r\n(b) Complete the solution by showing that the length of the shot is 125 + √20625. How does this number, which is about 268.6, compare with your previous calculation?\r\n(c) Comment on the presence of the number 125 in the answer. What is its significance?		2014-08-16 14:48:21.748157	2015-02-19 15:30:06.220488	To get the length of the shot you need to find the x intercept that isn't 0.\r\n0 = 10 + 0.5x − 0.002x²  /multiply both sides by 500 get 1x^2\r\n0 = 5000 + 250x - x²\r\n250x - x² = -5000       /multiply both sides by -1\r\n5000 = x² - 250x\r\na) add 125² to both sides. We do this to make the right side a perfect square so we can factor it.\r\n5000 + 125² = x² - 250x + 125²\r\nc) 5000 + 125² = (x - 125)²\r\n√(5000 + 125²) = x - 125\r\n√20625 = x - 125\r\nx = 125 + √20625 or 268.6  The number is very close to the calculator value\r\nc) 125 is the part of the parabola that descends, which we know is half of 250 from the previous problem.	\N	\N	Multiply by -500.  a) 125 is half of the middle term  b) the same  c) 125 is the axis of symmetry	Scott	Caroline	1
627	9	66	What is the average speed for a trip that consists of m miles at 30 mph followed by 4m miles at 50 mph?		2014-08-16 19:48:20.725002	2015-02-19 15:42:16.759624	5m/(m/30 + 4m/50)      r = d/t  total distance is 5m, total time is m/30 + 4m/50\r\n5m/(5m/150 + 12m/150)\r\n5m/(17m/150)\r\n(150/5)/17\r\n44.12 mph.	\N	\N	44.12 mph	*Avery		1
628	10	66	Solve each of the following equations. Answers should either be exact, or else accurate to three decimal places.\r\n(a) x² = 11 (b) 5s² − 101 = 144 (c) x² = 0 (d) 30 = 0.4m² + 12		2014-08-16 19:57:32.696223	2015-02-19 15:12:00.461738	(a) x² = 11             -> x = 3.317, -3.317\r\n(b) 5s² − 101 = 144     -> 5s² = 245  ->  s² = 49  -> 7, -7\r\n(c) x² = 0              -> x = 0\r\n(d) 30 = 0.4m² + 12     -> .4m² = 18  ->  m² = 45  -> m = 6.708, -6.708\r\n	\N	\N	a) ±√11 ≈ ±3.317   b)  ±7   c)  0   d) ±√45 ≈ ±6.708	*Miranda	Julia, Hannah, 	1
620	2	66	Sketch the graphs of y = x² + 5, y = x² − 4, and y = x² + 1 on the same axes. What is the effect of the value of c in equations of the form y = x² + c?		2014-08-16 03:51:57.871426	2015-02-19 15:00:58.7049	Graph attached, c determines the y intercept for these graphs.\r\n\r\n	\N	PBL_ans_66_1.PNG	Determines y intercept, causes vertical shift	Zach	Benji	1
644	3	69	The speed of sound in air is 1100 feet per second. The speed of sound in steel is 16500 feet per second. Robin, one ear pressed against the railroad track, hears a sound through the rail six seconds before hearing the same sound through the air. To the nearest foot, how far away is the source of that sound?		2014-08-18 00:04:18.417462	2015-02-25 19:13:02.131671	1100(t+6) =16500t\r\n1100t + 6600 = 16500t\r\n        6600 = 15400t\r\nt = .4286 seconds through steel\r\nDistance is 7071 feet\r\ncheck: 6.4286 * 1100 = 7071\r\n\r\n 	\N	\N	7071 feet	Jason	Matt	1
645	4	69	The point (4, 7) is on the graph of y = x² + c. What is the value of c?		2014-08-18 00:09:28.790114	2015-02-25 19:13:15.074453	7 = 16 + c\r\nc = -9	\N	PBL_ans_69_4.PNG	c = -9	Suzana		1
623	5	66	Graph the equations on the same system of axes: y = x², y = 0.5x², y = 2x², and y = −x². What is the effect of a in equations of the form y = ax²?		2014-08-16 19:09:18.634823	2015-02-19 15:02:48.483754	smaller than 1 makes the parabola wider, larger than 1 makes it narrower.	\N	PBL_ans_66_5.PNG	determines the width of the curve, or the rate of increase	Matt V.	Nicole	1
632	4	67	When asked to solve the equation (x − 3)² = 11, Jess said, “That’s easy — just take the square root of both sides.” Perhaps Jess also remembered that 11 has two square roots, one positive and the other negative. What are the two values for x, in exact form? (In this situation, “exact” means no decimals.)		2014-08-17 01:18:34.164098	2015-02-20 17:19:28.421097	x - 3 = +-√11\r\nx = 3+v11,3-√11\r\n	\N	\N	3±√11	Scott		1
638	3	68	Without a calculator, decide whether the first expression is equivalent to the second:\r\n(a) √75 and 5√3 (b) √800/2 and 10√2 (c) 2/√8 and √2/2 (d) √(1000/6) and (10√15)/3		2014-08-17 04:01:02.739689	2015-02-24 17:14:56.529061	(a) √75 and 5√3   yes, √75 -> √25*√3\r\n(b) √800/2 and 10√2, yes, √800 -> √400*√2 -> 20/√2  ->  20√2/2  ->  10√2\r\n(c) 2/√8 and √2/2   yes,  2/√8 -> 2/(√4*√2) -> 2/(2*√2) -> 1/√2  ->   -> √2/2\r\n(d) √(1000)/6 and (10√15)/3 yes,  ->  (√100*√(10)/√6  ->  (10√(10*6))/6  -> 10√(4*15)/6  ->  20√15/6 -> 10√15/3	\N	\N	a) yes  b)  yes  c) yes  d)  yes	Avery	Sam, Ben, Hannah	1
636	1	68	Use your calculator to evaluate the following: (a) √50/√2  (b) √28/√7  (c) √294/√6  Explain why your results make it reasonable to write √a/√b = √(a/b). Check that this rule also works for:  (d) √48/√6  (e) √84/√12  (f) √180/√15		2014-08-17 02:06:45.999476	2015-02-24 16:56:05.120752	(a) √50/√2     = 5\r\n(b) √28/√7     = 2\r\n(c) √294/√6    = 7\r\n(d) √48/√6     = 2√2\r\n(e) √84/√12    = √7\r\n(f) √180/√15   = 2√3	\N	\N	a) 5  b) 2  c) 7  d) 2√2  e) √7  f) 2√3	Matt V.	Liam	1
633	5	67	(Continuation) When asked to solve the equation x² − 6x = 2, Deniz said, “Hmm: : : not so easy, but I think that adding something to both sides of the equation is the thing to do.” This is indeed a good idea, but what number should Deniz add to both sides? How is this equation related to the previous one?		2014-08-17 01:45:18.86834	2015-02-20 17:20:40.124363	x² − 6x = 2\r\nadding 9 to both sides will make it a perfect square, easy to factor\r\nx² − 6x +9 = 2 + 9\r\n(x - 3)² = 2 + 9\r\nx - 3 = √11\r\nx = 3±√11 \r\nThe above is related to the previous one as it is the same equation once 9 is added to both sides.\r\n 	\N	\N	add (6/2)² or 9, to make it a perfect square, same solution as previous problem	Scott		1
640	5	68	Use the distributive property to factor each of the following:\r\n(a) x² + x³ + x^4 (b) πr² + 2πrh (c) 25x − 75x² (d) px + qx²		2014-08-17 04:11:16.984281	2015-02-24 17:20:43.092118	(a) x² + x³ + x^4   ->  x²(1 + x + x²)\r\n(b) r² + 2rh      ->  πr(r + 2h)\r\n(c) 25x − 75x²       ->  25x(1 - 3x)\r\n(d) px + qx²         ->  x(p + qx)	\N	\N	a) x²(1 + x + x²)   b) πr(r + 2h)  c) 25x(1 - 3x)  d) x(p + qx)	Matt K.	Henry	1
637	2	68	'Rationalizing denominators'. How are the decimal approximations for 6/√6 and √6 related? Was this predictable? Verify that the decimal approximations for 1/√8 and √2/4 are equal. Was this predictable? What is the effect of multiplying 1/√8 and √2/√2? To show equivalence of expressions, you might have to transform one radical expression to make it look like another.		2014-08-17 03:44:51.929533	2015-02-24 17:06:20.800745	They are equal, which makes sense since it would be 6√6/√6√6 or 6√6/b or √6, so it is predictable. \r\n1/√8 = 1/2√2 = √2/4, yes it is predictable.	\N	\N	the same,  yes it is predictable	Lucia	Caroline, Hannah	1
634	6	67	Some coffee roasters mix beans with different flavor profiles to customize their product. Selling prices are adjusted appropriately. For example, suppose that a roaster mixed some coffee worth $6.49 a pound with some coffee worth $10.89 a pound, thus obtaining 100 pounds of a mixture worth $9.24 a pound. How many pounds of each type of bean was used for this mixture?		2014-08-17 01:50:54.081679	2015-02-20 17:23:52.17303	a + b = 100\r\nb = 100 - a \r\n6.49a + 10.89b = 924\r\n6.49a + 10.89(100 - a) = 924\r\n6.49a + 1089 - 10.89a) = 924\r\n4.4a = 165\r\na = 37.5, b = 62.5\r\ncheck: 243.375 + 680.625 = 924\r\n	\N	\N	37.5 lbs of $6.49 and 62.5 lbs of $10.89	Maya		1
631	3	67	For the point (4, 24) to be on the graph of y = ax², what should the value of a be?		2014-08-17 01:15:14.310766	2015-02-20 17:17:57.14125	24 = 16a\r\na = 3/2	\N	\N	a = 3/2	Jaden		1
630	2	67	You have seen that the graph of any quadratic function is a parabola that is symmetrical with respect to a line called the axis of symmetry, and that each such parabola also has a lowest or highest point called the vertex . Sketch a graph for each of the following quadratic functions. Identify the coordinates of each vertex and write an equation for each axis of symmetry.\r\n(a) y = 3x² + 6 (b) y = x² + 6x (c) y = 64 − 4x² (d) y = x² − 2x − 8	Wrong equation graphed for d, replot	2014-08-17 00:45:53.987612	2015-02-20 17:18:18.656673	a) vertex -> (0,6), x = 0\r\nb) vertex -> (-3,-9), x = -3\r\nc) vertex -> (0,64), x = 0\r\nd) vertex -> (1,-7), x = 1	\N	PBL_ans_67_2.PNG	a) (0,6), x = 0  b)  (-3,-9), x = -3   c) (0,64), x = 0   d)  (1,-9), x = 1	Lucia		1
635	7	67	Suppose that m and n stand for positive numbers, with n < m. Which of the following expressions has the largest value? Which one has the smallest value?\r\n(a) (m + 1)/(n + 1)  (b) (m + 1)/n  (c) m/n  (d) m/(n + 2)   (e) m/(n + 1), 		2014-08-17 01:56:06.769455	2015-02-23 16:50:21.833232	b is the largest, since it has the largest numerator and the smallest denominator\r\nd is the smallest, since it has the smallest numerator and the largest denominator\r\n\r\n	\N	\N	d is the smallest, b is the largest	Avery	Jared, Henry, Sam	1
651	10	69	Without using a calculator, solve each of the following quadratic equations:\r\n(a) (x + 4)² = 23 (b) 7x² − 22x = 0 (c) x² − 36x = 205 (d) 1415 − 16x² = 0		2014-08-18 01:11:28.201635	2015-02-25 15:34:36.726614	(a) (x + 4)² = 23    ->  x + 4 = ±√23  ->  x = -4 ±√23\r\n(b) 7x² − 22x = 0    ->  x(7x − 22) = 0  -> x = 0, x = 22/7 \r\n(c) x² − 36x = 205   ->  x^2 − 36x + 324 = 529 = (x - 18)^2 = 529 -> (x - 18) = ±√529 -> x = 18±√529\r\n(d) 1415 − 16x² = 0  -> 16x² = 1415 ->  x² = 1415/16  ->  x = ±√(1415/16)	\N	\N	a) -4 ±√23  b) 0,22/7  c)  18±√529, -5,41  d) ±√(1415/16), ±9.404		Ben	1
647	6	69	Using only positive numbers, add the first two odd numbers, the first three odd numbers, and the first four odd numbers. Do your answers show a pattern? What is the sum of the first n odd numbers?		2014-08-18 00:37:31.655026	2015-02-20 15:22:48.781447	1+3 = 4\r\n1+3+5 = 9\r\n1+3+5+7 = 16\r\n1+3+5+7+9 = 25\r\nThe sum of the first n odd numbers is n²	\N	\N	The sum of the first n odd numbers is n²			1
654	3	70	In the diagram, the dimensions of a piece of carpeting have been marked in terms of x. All lines meet at right angles. Express the area and the perimeter of the carpeting in terms of x.		2014-08-18 01:58:46.576848	2015-02-24 15:52:24.951004	area = x(x+3) + (x+2)(x+4) - x² + 3x + x² + 6x  + 8  ->  2x² + 9x + 8\r\nperimeter = x + 2 + x + 2 + x + 3 + x + 4 + 2x + 7  ->  6x + 18	PBL_graph_70_3.PNG	\N	area -> 2x² + 9x + 8, perimeter 6x + 18			1
658	7	70	If n stands for a perfect square, what formula stands for the next largest perfect square?		2014-08-18 02:49:11.992299	2015-02-24 16:04:59.634858	(√n + 1)(√n + 1)\r\nn + 2√n + 1	\N	\N	n + 2√n + 1			1
649	8	69	(Continuation) Carry out the same calculations, but replace y = x² by a quadratic function of your own choosing. Is the new table of differences linear?		2014-08-18 00:48:01.107753	2015-02-24 16:20:36.91402	y = 2x² + 2x +1\r\n   x   y   diff\r\n   0   1\r\n   1   5    4\r\n   2  13    8\r\n   3  25   12\r\n   4  41   16\r\n   5  61   20\r\nYes, the new table of differences is linear.	\N	\N	Yes it is linear			1
691	1	75	In solving an equation such as 3x²−11x = 4 by completing the square, it is customary to first divide each term by 3 so that the coefficient of x² is 1. This transforms the equation into x² − 11/3 x = 4/3 . Now continue to solve by the completing the square method, remembering to take half of 11/3 , square it and add it to both sides of the equation. Finish the solution.		2014-08-23 14:26:15.226034	2014-08-23 14:26:15.226034	x² − 11x/3  = 4/3\r\nx² − 11x/3 + 121/36  = 4/3 + 121/36\r\n(x - 11/6)² = 48/36 + 121/36\r\nx - 11/6 = √(169/36)\r\nx = 11/6 ±13/6\r\nx = -1/3 or 4	\N	\N	\N	\N	\N	\N
652	1	70	The cost of a ham-and-bean supper at a local church was $6 for adults and $4 for children. At the end of the evening, the organizers of the supper found they had taken in a total of $452 and that 86 persons had attended. How many of these persons were adults?		2014-08-18 01:11:39.969047	2015-02-24 15:47:38.685165	a + c = 86\r\n6a + 4c = 452\r\n4a + 4c = 344\r\n2a = 108\r\na = 54\r\nc = 32\r\ncheck: 54*6 + 32*4 = 324 + 128 = 452\r\n	\N	\N	54 adults			1
655	4	70	Evaluate the expression 397(2.598) + 845(2.598) − 242(2.598) mentally		2014-08-18 02:01:10.505402	2015-02-24 15:53:41.439811	about 2,600 (about 1000 times 2.598)	\N	\N	2598			1
656	5	70	Kirby is four miles from the train station, from which a train is due to leave in 56 minutes. Kirby is walking along at 3 mph, and could run at 12 mph if it were necessary. If Kirby wants to be on that train, it will be necessary to do some running! How many miles of running?		2014-08-18 02:37:47.954268	2015-02-24 16:00:10.551316	r + w = 56/60\r\nw = 14/15 - r\r\n12r + 3(14/15 - r) = 4\r\n12r + 42/15 - 3r = 4\r\n9r = 18/15\r\nr = 18/135  ->  .13 of an hour running or 8 minutes, or 1.6 miles\r\ncheck: .88889*3 = 2.6667\r\n\r\n	\N	\N	8 minutes, 1.6 miles			1
657	6	70	The work at right shows the step-by-step process used by a student to solve x² +6x−5 = 0 by the method of completing the square. Explain why the steps in this process are reversible. Apply this understanding to find a quadratic equation ax² + bx + c = 0 whose solutions are x = 7 + √6 and x = 7 − √6.		2014-08-18 02:45:20.834139	2015-02-24 16:04:26.72453	Each step is reversible because each one either does the same operation to both sides of the equation or simplifies part of the equation. Both of these operations can be done in either direction without affecting the validity of the equation.\r\nx = 7 + √6 and x = 7 − √6\r\nx - 7 = ±√6\r\n(a - 7)² = 6\r\na² - 14a + 49 = 6\r\na² - 14a + 43 = 0\r\n\r\n	PBL_graph_70_6.PNG	\N	a² - 14a + 43 = 0			1
659	8	70	Dale hikes up a mountain trail at 2 mph. Because Dale hikes at 4 mph downhill, the trip down the mountain takes 30 minutes less time than the trip up, even though the downward trail is three miles longer. How many miles did Dale hike in all?		2014-08-18 02:57:41.220063	2015-02-24 16:05:34.427195	d = u+3\r\nu/2 = ((u+3)/4)+.5\r\n2u = u+3 + 2\r\nu = 5 miles\r\nd = 8 miles\r\n13 miles total\r\ncheck: time up 2.5 hours, time down 2 hours.	\N	\N	13 miles			1
660	9	70	Express the areas of the following large rectangles in two ways. First, find the area of each small rectangle and add the expressions. Second, multiply the total length by the total width.		2014-08-18 02:58:20.024969	2015-02-24 16:07:45.738166	a) 5(6+12+4) = 110\r\n   5*6 + 5*12 + 5*4 = 110\r\nb) 3x² + 21x\r\n   3x(x+7)\r\nc) (m+2)(m+15) = m² + 17m + 30\r\n   m² + 2m + 15m + 30 -> m² + 17m + 30	PBL_ans_70_9.PNG	\N	a) both 110  b) 3x² + 21x  c) m² + 17m + 30			1
650	9	69	Write (2a)² without parentheses. Is (2a)² larger than, smaller than, or the same as 2a²? Make reference to the diagram at right in writing your answer. Draw a similar diagram to illustrate the non-equivalence  of (3a)² and 3a².		2014-08-18 00:48:28.433051	2015-02-25 15:21:45.61968	2a²\r\n2a² is smaller than (2a)², because in the first only a is getting squared, while in the second, 2 is getting squared also. Thus 2a² is half of (2a)², as can be seen in the diagram.	PBL_graph_69_9.PNG	PBL_ans_69_9.PNG	2a² is smaller than (2a)²		Sam	1
107	4	12	Find the smallest positive integer divisible by every positive integer less than or equal to 10.		2014-07-12 16:39:51.747283	2014-08-18 18:07:50.993701	9*8*7*5 = 2,520\r\n\r\n9 makes it also divisible by 3\r\n8 makes it also divisible by 2 and 4\r\n3 and 2 make it divisible by 3 and 2\r\n5 times the other 3 makes it also divisible by 10	\N	\N	\N	\N	\N	\N
176	9	20	Solve the following inequality for x: 2(1 − 3x) − (x − 5) > 1\r\n		2014-07-16 20:37:47.227394	2014-08-18 19:03:56.303314	x: 2(1 − 3x) − (x − 5) > 1\r\n   2 - 6x -x + 5 > 1\r\n  -7x + 7 > 1\r\n        7 > 7x + 1\r\n        6 ? 7s\r\n       6/7 < x\r\n         x > 6/7\r\n\r\ncheck: 2(1 - 18/7) - (6/7 - 5) = 1\r\n       2 - 36/7 - 6/7 + 5 = 1\r\n               7 - 42/7 = 1\r\n                 7 - 6 = 1	\N	\N	\N	\N	\N	\N
334	1	35	The fuel efficiency of a car depends on the speed at which it is driven. For example, consider Kit’s Volvo. When it is driven at r miles per hour, it gets m = 32 − 0.2|r − 55| miles per gallon. Graph m versus r, for 0 < r ≤ 80. Notice that this graph has a vertex. What are its coordinates?		2014-07-29 22:53:47.203846	2014-10-27 16:19:38.07901	m = 32 − 0.2|r − 55|\r\n\r\nThe coordinates of the vertex are (55,32)	\N	PBL_ans_35_1.PNG	(55,32)	Maya	Nicole	1
664	4	71	During the swimming of a 50-yard sprint in a 25-yard pool, the racers swim away from the starting line and then return to it. Suppose that Alex, who always swims at a steady rate, takes 24 seconds to complete the race. Let y stand for the distance from Alex to the starting line when the race is t seconds old. Make a graph of y versus t, and write an equation for this graph.		2014-08-18 22:24:12.966018	2015-02-24 16:13:15.145156	y = -|25-50t/24|+25	\N	PBL_ans_71_4.PNG	y = 25-|25-25t/24|			1
667	7	71	Without using a calculator, simplify |3 − √5| + 4 by writing an equivalent expression without absolute-value signs. Do the same for |3 − √10 | + 4. Does your calculator agree?		2014-08-19 03:01:37.891933	2015-02-26 18:11:20.72484	|3 − √5| + 4  ->  3 - √5 + 4, -3 + √5 + 4  ->  7 - √5, 1 + √5\r\n|3 − √10| + 4 ->  3 - √10 + 4, -3 + √10 + 4  ->  7 - √10, 1 + √10\r\n4.7639, 3.2360\r\n3.8377, 4.1622\r\n	\N	\N	7 - √5, 1 + √5, 7 - √10, 1 + √10, yes			1
117	5	13	Last year, three fifths of the Outing Club were girls, but this year the number of boys doubled and six new girls joined. There are now as many boys in the club as there are girls. How many members did the club have last year?		2014-07-12 20:20:48.716226	2014-08-19 13:13:21.841835	b = g this year \r\nb/2 = 2/5(3/2b-6)\r\nb/2 = 6/10(b) - 12/5\r\nb = 12/10(b) - 24/5\r\n10b = 12b - 48\r\n2b = 48\r\nb = 24\r\n\r\ncheck: current year, 24b and 24g, last year, 12 boys and 18 girls, 30 total \r\n\r\n	\N	\N	\N	\N	\N	\N
692	2	75	'Completing the square'. Confirm that the equation ax² + bx + c = 0 can be converted into the form x² + (b/a)x = −c/a. Describe the steps. To achieve the goal suggested by the title, what should now be added to both sides of this equation?		2014-08-23 14:31:17.867014	2014-08-23 14:31:17.867014	ax² + bx + c = 0\r\nax² + bx = -c                 subtract c from both sides\r\nx² + (b/a)x = -c/a            divide all terms by a\r\nNow add (b/2a)² to both sides of the equation.	\N	\N	\N	\N	\N	\N
344	11	35	(Continuation) Suppose that you are in a car that has been traveling along the Buzzardtown-Dry Gulch road for t minutes at 30 miles per hour. How far is it to the nearest gas station, in terms of t? Graph this distance versus t. What are the coordinates of the vertex of your graph?		2014-08-01 00:47:58.87806	2014-10-29 14:20:10.682917	It takes 2 minutes to travel 1 mile, so the nearest gas station would be 20 - |t - 20| minutes. Since we're working in minutes, we divide 30/60, to get a speed of 1/2 miles per minute. Thus we have to multiply the previous equation by 1/2 to get the correct distance.\r\nThe final equation is:\r\nd = (20-|t-20|)/2	\N	PBL_ans_35_11.PNG	d=(20-|t-20|)/2 or d=10-|.5t-10|, vertex at 20,10	Jaden, Lucia	Jared, Hannah, Caroline	1
662	2	71	Apply the zero-product property to solve the following equations:\r\n(a) (x − 2)(x + 3) = 0 (b) x(2x + 5) = 0 (c) 5(x − 1)(x + 4)(2x − 3) = 0		2014-08-18 03:13:30.051635	2015-02-24 16:09:52.266782	a) x = 2 or x = -3\r\nb) x = 0 or x = -2.5\r\nc) x = 1 or x = -4 or x = 3/2	\N	\N	a) 2,-3  b) 0,-2.5  c) 1,-4,3/2			1
663	3	71	Solve the following equations for x, without using a calculator:\r\n(a) x² - 5x = 0 (b) 3x² + 6x = 0 (c) ax² + bx = 0\r\n		2014-08-18 22:08:20.300862	2015-02-24 16:10:42.172375	(a) x² - 5x = 0   -> x(x - 5)       ->  x = 0, 5\r\n(b) 3x² + 6x = 0  -> 3x(x + 2) = 0, ->  x = 0, -2\r\n(c) ax² + bx = 0  -> ax(x + b) = 0, ->  x = 0, -b/a	\N	\N	a) 0, 5  b) 0, -2  c) 0, -b/a			1
666	6	71	Sketch the graphs of y = x² − 12x, y = −2x² − 14x, and y = 3x² + 18x. Write an equation for the symmetry axis of each parabola. Devise a quick way to write an equation for the symmetry axis of any parabola y = ax² +bx. Test your method on the three given examples.		2014-08-19 02:42:43.134518	2015-02-26 18:08:13.922663	y = x2 − 12x,      x = 6\r\ny = −2x2 − 14x,    x = -7/2\r\nand y = 3x2 + 18x, x = -3\r\nAxis of symmetry = -b/(2a)\r\n-(-12/2) = 6\r\n-(-14/-4) = -7/2\r\n-18/6 = -3	\N	pbl_ans_71_-6.PNG	6, - 7/2, -3,  Axis of symmetry = -b/(2a)			1
665	5	71	In the shot-put competition at the Exeter-Andover track meet, the trajectory of Blair’s best put is given by the function h = −0:0186x2+x+5, where x is the horizontal distance the shot travels, and h is the corresponding height of the shot above the ground, both measured in feet. Graph the function and find how far the shot went. What was the greatest height obtained? In the given context, what is the meaning of the “5” in the equation?	Slightly wrong equation in graph, fix	2014-08-18 22:33:18.29085	2015-02-26 18:02:28.020604	Distance- 58.66 feet\r\nMax Height- ~18.51\r\nThe 5 indicates that the shotput is released 5 feet above the ground.	\N	PBL_ans_71_5.PNG	58.4 feet, height 18.4, released 5 feet up			1
668	8	71	Multiply: (a) (3x)(7x) (b) (3x)(7 + x) (c) (3 + x)(7 + x)		2014-08-19 03:03:01.398008	2015-02-26 18:13:32.104674	(a) (3x)(7x)       -> 21x²\r\n(b) (3x)(7 + x)    -> 21x + 3x²\r\n(c) (3 + x)(7 + x) -> 21 + 10x + x²	\N	\N	a) 21x²     b) 21x + 3x²    c) 21 + 10x + x²			1
669	1	72	Given P = (1, 4), Q = (4, 5), and R = (10, 7), decide whether or not PQR is a straight line, and give your reasons.		2014-08-19 03:08:02.531784	2015-02-26 18:13:54.44029	(5-4)/(4-1) = 1/3\r\n(7-5)/(10-4) = 2/6 = 1/3\r\nPQR is a straight line, since the slope between the left point and the center point is the same as the slope between the center point and the right point.\r\n	\N	\N	It is a straight line			1
670	2	72	All the dimensions of the twelve rectangles in the figure are either a or b. Write an expression for the sum of the areas of the twelve pieces. This should help you to show how these twelve pieces can be fit together to form one large rectangle.		2014-08-21 14:20:57.40499	2015-02-26 18:14:56.784249	area is 2a² + 7ab + 3b²\r\ndimensions are (a + 3b) and (2a + b)	PBL_graph_72_2.PNG	\N	(a + 3b)(2a + b)			1
672	4	72	(Continuation) Sketch the graphs y = 2(x−3)², y = −3(x−3)², and y = 0.5(x−3)². What do these graphs all have in common? How do they differ? What is the equation of a parabola whose vertex is at the point (−2, 0), is the same size as the graph y = 2(x − 3)², and opens up?		2014-08-21 14:37:16.352137	2015-02-26 18:19:01.35231	They all have the same vertex. They differ in that one opens down (with the negative coefficient) and two open up, and they have different widths.\r\ny = 2(x + 2)²\r\n	\N	PBL_ans_72_4.PNG	Same vertex, different widths, y = 2(x + 2)²			1
679	11	72	(Continuation) Sketch the graph of y = 2x² − 6x − 3 along with its axis of symmetry. Find the coordinates of the vertex of this parabola. How do these coordinates compare with the vertex of y = 2x² −6x? Find an equation for the graph of a quadratic curve that has the same axis of symmetry as y = 2x² − 6x, but whose vertex is at (1.5,−2.5).		2014-08-21 16:46:46.723058	2015-02-27 13:13:04.597995	Vertex is (1.5, -7.5)\r\nThe x value of the vertex is the same, which makes sense since the axis of symmetry hasn't changed, but the y value is 3 less.\r\ny= 2x² − 6x + 2	\N	PBL_ans_72_11.PNG	Vertex is (1.5, -7.5), vertex is 3 units lower, y= 2x² − 6x + 2			1
677	9	72	(Continuation) Show that x² − 2px − 8p² can be written in factored form.		2014-08-21 15:07:09.799986	2015-02-27 13:10:44.761621	(x - 4p)(x + 2p) = x² − 2px − 8p²	\N	\N	(x - 4p)(x + 2p)			1
680	1	73	The table at right displays some values for a quadratic function y = ax² + bx + c.\r\n(a) Explain how to use the table to show that c = 0.\r\n(b) A point is on a curve only if the coordinates of the point satisfy the equation of the curve. Substitute the tabled coordinates (1, 2) into the given equation to obtain a linear equation in which a and b are the unknowns. Apply the same reasoning to the point (2, 6).\r\n(c) Find values for a and b by solving these two linear equations.\r\n(d) Use your values for a and b to identify the original quadratic equation. Check your result by substituting the other two tabled points (3, 12) and (4, 20) into the equation.		2014-08-21 16:55:44.527151	2014-08-21 16:55:44.527151	a) c must be 0 because when x is 0 y is 0, and this wouldn't be the case if c wasn't 0.\r\nb)  a + b = 2\r\n  4a + 2b = 6\r\nc) b = 2 - a\r\n  4a + 2(2-a) = 6\r\n  4a + 4 - 2a = 6\r\n  2a + 4 = 6\r\n  2a = 2\r\n   a = 1\r\n   b = 1\r\nd) y = x² + x\r\n   3² + 3 = 12\r\n   4² + 4 = 20\r\n\r\n	PBL_graph_73_1.PNG	\N	\N	\N	\N	\N
693	3	75	(Continuation) The left side of the equation x²+ (b/a)x+ b²/4a² = b²/4a² − c/a can be factored as a perfect square trinomial. Show how. The right side of the equation can be combined over a common denominator. Show how. Finish the solution of the general quadratic equation by taking the square root of both sides of your most recent equation. The answer is called the 'quadratic formula'. Apply your formula: Solve x² + 2x − 3 = 0 by letting a = 1, b = 2, and c = −3.		2014-08-23 14:51:44.87328	2014-08-23 14:51:44.87328	x²+ (b/a)x+ b²/4a² = b²/4a² − c/a\r\n(x + b/2a)² = b²/4a² − 4ac/4a²\r\n(x + b/2a)² = (b² − 4ac)/4a²\r\nx + b/2a = ±√(b² − 4ac)/2a\r\n2ax + b = ±√(b² − 4ac)\r\n2ax = -b ±√(b² − 4ac)\r\nx = -(b ±√(b² − 4ac))/2a\r\nx = -(2±√(4- -12))/2\r\nx = -(2±4)/2\r\nx = -3 or x = 1\r\n	\N	\N	\N	\N	\N	\N
706	3	77	Jess bought a can of paint, whose label stated that the contents of the can were sufficient to cover 150 square feet. The surface that Jess wants to paint is a square, each edge of which is i inches long. Given that i is a whole number, how large can it be?		2014-08-23 23:23:54.336383	2014-08-23 23:23:54.336383	1 sq. ft. = 144 sq. inches.\r\n150 sq. ft. = 21600 sq. inches.\r\n√21600 = just under 147, so the square can be no larger than 146 inches on a side.\r\ncheck: 146/12 = 12.167 feet, squared = 148.02 sq. ft. 147/12 = 2.25, squared = 150.0625 feet	\N	\N	\N	\N	\N	\N
671	3	72	Sketch the graphs of y = x², y = (x − 2)², y = (x + 3)², and y = (x − 5)² on the same set of coordinate axes. Make a general statement as to how the graph of y = (x−h)² is related to the graph of y = x².		2014-08-21 14:28:43.885464	2015-02-26 18:16:39.63392	The number after the x value shifts the graph so many units to the left or right, to the right if h is negative, as that makes y larger, and to the left if h is positive, as that makes y smaller.	\N	PBL_ans_72_3.PNG	Shifts left or right if positive or negative			1
675	7	72	Given the equation s = πr + πre, solve the formula for: (a) e (b) r		2014-08-21 14:51:04.626386	2015-02-27 13:09:54.873974	a) s = πr + πre   -> πr(1 + e)  ->   1/πr = (1 + e)  ->   e = 1/πr - 1 \r\nb) s = πr + πre   -> s = r(π + πe)   ->  r = s/(π + πe)	\N	\N	a e = 1/πr - 1   b) r = s/(π + πe)			1
673	5	72	The hands of a clock point in the same direction at noon, and also at midnight. How many times between noon and midnight does this happen	?	2014-08-21 14:40:02.011827	2015-02-26 18:28:01.396845	It has to happen each time the minute hand makes a revolution, at some point it has to point in the same direction as the hour hand. i.e. at noon, at 1:05, 2:10, 3:15. 4:20, 5:25, 6:30, 7:35, 8:40, 9:45, 10:50, 11:55 \r\nThus this will happen 10 times between noon and midnight, (not counting noon and midnight).	\N	\N	10 times			1
674	6	72	The axis of symmetry of a parabola is the line x = 4.\r\n(a) Suppose that one x-intercept is 10; what is the other one?\r\n(b) Suppose the point (12, 4) is on the graph; what other point also must be on the graph?		2014-08-21 14:45:57.151518	2015-02-27 13:08:35.939757	a) -2\r\nb) (-4,4)	\N	\N	a) -2     b) (-4,4)			1
676	8	72	Solve x² − 2px − 8p² = 0 for x in terms of p by completing the square.		2014-08-21 15:05:59.793735	2015-02-27 13:10:18.873298	x² − 2px − 8p² = 0\r\nx² − 2px − 8p² + 9p² = 9p²\r\nx² − 2px + p² = 9p²\r\n(x - p)² = 9p²\r\nx - p = ±3p\r\nx = p ±3p\r\nx = 4p or x = -2p	\N	\N	x = 4p or x = -2p			1
678	10	72	Find the equation of the axis of symmetry for the graph of y = 2x² − 6x. Sketch the graph of this equation in your notebook, including the axis of symmetry. What are the coordinates of the vertex of the graph?		2014-08-21 16:37:01.205044	2015-02-27 13:11:48.341046	0 = 2x² − 6x\r\n3x = x²\r\n x = 3 or x = 0\r\nAxis of symmetry is 1.5\r\ny = 2*2.25 - 9 = -4.5\r\nVertex is (1.5, -4.5)\r\n\r\n	\N	\N	Axis of symmetry is 1.5, Vertex is (1.5, -4.5)			1
681	2	73	Gerry Anium is designing another rectangular garden. It will sit next to a long, straight rock wall, thus leaving only three sides to be fenced. This time, Gerry has bought 150 feet of fencing in one-foot sections. Subdivision into shorter pieces is not possible. The garden is to be rectangular and the fencing (all of which must be used) will go along three of the sides as indicated in the picture.\r\n(a) If each of the two sides attached to the wall were 40 ft long, what would the length of the third side be?\r\n(b) Is it possible for the longest side of the rectangular garden to be 85 feet long? Explain.\r\n(c) Let x be the length of one of the sides attached to the wall. Find the lengths of the other two sides, in terms of x. Is the variable x continuous or discrete?\r\n(d) Express the area of the garden as a function of x, and graph this function. For what values of x does this graph have meaning?\r\n(e) Graph the line y = 2752. Find the coordinates of the points of intersection with this line and your graph. Explain what the coordinates mean in relation to the garden.\r\n(f) Gerry would like to enclose the largest possible area with this fencing. What dimensions for the garden accomplish this? What is the largest possible area?		2014-08-21 19:07:42.565463	2014-08-21 19:07:42.565463	a) 150 - (2*40) = 70 feet\r\nb) No, it would have to be the side parallel to the stone wall, so 150 - 85 = 65, the short sides would each be 32.5 feet, and fractions aren't allowed.\r\nc) x, and 150 - 2x, discrete\r\nd) x(150 - 2x) ->  -2x² + 150x. It only has meaning for positive integer values of x.\r\ne) The coordinates show the area of the graph is 2752 sq. feet when x = 32 or 43.\r\nf) The axis of symmetry goes through 37.5, so the value of y at that point would be the maximum possible area if non integer values were possible. Since they aren't the dimensions have to be either 37 x 76 or 38 x 74, both of which multiply to 2812 sq. ft.	PBL_graph_73_2.PNG	PBL_ans_73_2.PNG	\N	\N	\N	\N
682	3	73	Lee finds the identity (a + b)² = a² + 2ab + b² useful for doing mental arithmetic. For example, just ask Lee for the value of 752, and you will get the answer 5625 almost immediately — with no calculator assistance. The trick is to use algebra by letting 10k+5 represent a typical integer that ends with 5. Show that the square of this number is represented by 100k(k + 1) + 25. This should enable you to explain how Lee is able to calculate 752 = 5625 so quickly. Try the trick yourself: Evaluate 35², 95², and 205² without using calculator, paper, or pencil.		2014-08-21 19:18:10.347048	2014-08-21 19:18:10.347048	(10k+5) * (10k+5) = 100k² + 10k + 25 = 100k(k + 1) + 25\r\nTake the number, subtract 5 and divide by 10 to get k.\r\nMultiply k by 100k * (k + 1), i.e. 2000*3, and add 25.\r\n35²   -> k is 3   -> 300*4+25     -> 1,225\r\n95²   -> k is 9   -> 900+10+25    -> 9,025\r\n205²  -> k is 20  -> 2000*21+25   -> 42,025\r\n	\N	\N	\N	\N	\N	\N
683	4	73	Sketch the graphs of y = (x − 4)2 and y = 9 on your calculator screen. What are the coordinates of the point(s) of intersection? Now solve the equation (x−4)² = 9. Describe the connection between the points of intersection on the graph and the solution(s) to the equation.		2014-08-21 19:22:22.688745	2014-08-21 19:22:22.688745	(x−4)² = 9\r\n x-4 = ±3\r\nx = 1 or x = 7\r\nThe intersections on the graph are the same as the solutions to the equation.	\N	\N	\N	\N	\N	\N
684	5	73	Solve x² + bx + c = 0 by the method of completing the square. Apply your answer to the example x² + 5x + 6 = 0 by setting b = 5 and c = 6.		2014-08-21 19:34:44.855127	2014-08-21 19:34:44.855127	x² + bx + c = 0\r\nx² + bx  = -c\r\nx² + bx + (b/2)² = b²/4 - c\r\n(x + b/2)² = b² - 4c\r\n x + b/2 = ±√(b² - 4c)\r\n 2x + b = ±√(b² - 4c)\r\n x = (-b ±√(b² - 4c))/2\r\n \r\n	\N	\N	\N	\N	\N	\N
685	1	74	The graph of y = x² − 400 is shown at right. Notice that no coordinates appear in the diagram. There are tick marks on the axes, however, which enable you, without using your graphing calculator, to figure out the actual window that was used for this graph. Find the high and low values for both the x-axis and the y-axis. After you get your answer, check it on your calculator. To arrive at your answer, did you actually  need to have tick marks on both axes?		2014-08-21 19:46:19.384624	2014-08-21 19:46:19.384624	y = x² − 400\r\nx² = 400\r\nx = ±20\r\nTick marks pm x axos are 10 each. min is -40, max is 40.\r\nTick marks on the y axis are 200. min is -200, max is 1200.\r\nYou only need one set of tick marks to as you can figure the other from the graph.	PBL_graph_74_1.PNG	\N	\N	\N	\N	\N
686	2	74	Sketch the graph of y = x² + 3 and y = |x| + 3 on the same axis in your notebook. List three ways that the two graphs are alike and three ways in which they differ. Be sure your graph is large enough to clearly show these differences. On another axis, sketch the graph of y = 2(x−3)² and y = 2|x−3|. Also be prepared to explain how these two graphs compare.		2014-08-23 13:38:55.559195	2014-08-23 13:39:52.546268	Similarities: Both graphs open upwards, they have the same vertex, they have the same axis of symmetry\r\nDifferences: They have different shapes, one is formed of curved lines, the other straight lines, the y values for the parabola spread out much more slowly\r\n	\N	PBL_ans_74_2.PNG	\N	\N	\N	\N
687	3	74	As shown below, the expression 5(x+2)(x+3) can be pictured as five rectangles, each one with dimensions (x + 2) by (x + 3).\r\n(a) Write out the product 5(x+2)(x+3), and show that it also corresponds to the diagram.\r\n(b) Explain why 5(x + 2)(x + 3) is equivalent to (x + 2)(5x + 15), using algebraic code as well as a labeled diagram to support your answer.		2014-08-23 13:46:42.174245	2014-08-23 13:46:42.174245	a) 5(x+2)(x+3)  ->  5x² + 25x + 30, the diagram contains 5x²s, 25xes, and 5 regions of 6, adding to 30.\r\nb) 5(x + 2)(x + 3)  ->  (x + 2)*(5*(x + 3))  ->  (x + 2)(5x + 15), since the 5 can be distributed over either of the other terms.	PBL_graph_74_3.PNG	\N	\N	\N	\N	\N
688	4	74	When asked to find the equation of the parabola pictured at right, Ryan looked at the x-intercepts and knew that the answer had to look like y = a(x+1)(x−4), for some coefficient a. Justify Ryan’s reasoning, then finish the solution by finding the correct value of a.		2014-08-23 13:57:06.901692	2014-08-23 13:57:06.901692	The x intercepts mean y is zero, and y can only be zero if one of the factors of the x² term resolved to zero. So to get a y intercept of -1, x would have to have to be -1, and to get 4 would have to be -4.\r\n-4 = a(2+1)(2−4)\r\n-4 = a(2+1)(2−4)\r\n-4 = -6a\r\na = 2/3	PBL_graph_74_4.PNG	PBL_ans_74_4.PNG	\N	\N	\N	\N
689	5	74	(Continuation) Find an equation for the parabola, in 'factored form', y = a(x − p)(x − q), whose symmetry axis is parallel to the y-axis, whose x-intercepts are −2 and 3, and whose y-intercept is 4. Why is factored form sometimes referred to as 'intercept form'?		2014-08-23 14:06:41.098261	2014-08-23 14:06:41.098261	y = a(x + 2)(x - 3)  ->  y = a(x²-x-6)\r\n-4 = -6a \r\na = 2/3\r\ny = 2/3(x+2)(x-3)\r\nFactored form can be called y-intercept form because the terms added or subtracted to x in the two factors are the y intercepts.	\N	\N	\N	\N	\N	\N
690	6	74	There are many quadratic functions whose graphs intersect the x-axis at (0, 0) and (6, 0). Sketch graphs for a few of them, including the one that goes through (3, 9). Other than their axis of symmetry, what do all these graphs have in common? How do the graphs differ?		2014-08-23 14:17:04.126551	2014-08-23 14:17:04.126551	y = ax(x-6)\r\n9 = 3a(-3)\r\n9 = -9a\r\na = -1\r\ny = -x(x-6)	\N	PBL_ans_74_6.PNG	\N	\N	\N	\N
705	2	77	Sketch the graphs of y = (x − 4)2 and y = (4 − x)2. What do you notice about the graphs? Explain why this is true.		2014-08-23 21:04:13.3516	2014-08-23 21:04:13.3516	They are the same graph, since 4-x and x-4 are opposites; when they are squared the signs are removed and they end up being the same numbers. i.e. 4-1 -> 3 and 1-4 -> 3, both square to 9.	\N	PBL_ans_77_2.PNG	\N	\N	\N	\N
694	4	75	As long as the coefficients a and b are nonzero, the parabolic graph y = ax² + bx has two x-intercepts. What are they? Use them to find the axis of symmetry for this parabola. Explain why the axis of symmetry for y = 2x²−5x−12 is the same as the axis of symmetry for y = 2x² − 5x. In general, what is the symmetry axis for y = ax² + bx + c? Does your description make sense for y = 2x² − 5x + 7, even though the curve has no x-intercepts?		2014-08-23 15:10:37.921329	2014-08-23 15:10:37.921329	y = ax² + bx\r\ny = x(ax + b)\r\na = 0 or a = -b/a\r\nThe axis of symmetry is thus -b/2a\r\nThe c term only moves the graph up and down by changing the final y value without being affected by x, so it doesn't change the curve's shape or vertex.\r\nIn general, the axis of symmetry is -b/2a. \r\nIt works even if there are no y intercepts since the graph has only been shifted upwards and still has the same axis of symmetry.\r\n	\N	\N	\N	\N	\N	\N
695	5	75	(Continuation). If you know the axis of symmetry for a quadratic function, how do you find the coordinates of the vertex? Try your method on each of the following, by first finding the symmetry axis, then the coordinates of the vertex.\r\n(a) y = x² + 2x − 3 (b) y = 3x² + 4x + 5		2014-08-23 15:23:08.767973	2014-08-23 15:23:08.767973	The axis of symmetry is the x value for the equation, so substitute that in and solve for y.\r\n(a) y = x² + 2x − 3    x = -2/2 = -1,  y = 1 -2 -3 = -4,  vertex is (-1, -4) \r\n(b) y = 3x² + 4x + 5   x = -2/3,  y = 4/3 - 8/3 + 5  ->  y = -4/3 + 5   ->  y = -4/3 + 15/3  ->  y = 11/3, vertex is (-2/3, 11/3)	\N	\N	\N	\N	\N	\N
696	6	75	Graph the equations y = (x−5)², y = (x−5)²−4, and y = (x − 5)² + 2. Write the coordinates of the vertex for each curve. Describe how to transform the first parabola to obtain the other two. A fourth parabola is created by shifting the first parabola so that its vertex is (5,−7). Write an equation for the fourth parabola.		2014-08-23 16:30:09.585932	2014-08-23 16:34:03.826938	y = (x−5)², vertex is (5,0)\r\ny = (x−5)²−4,  vertex is (5,-4)\r\ny = (x−5)² + 2, vertex is (5,2)\r\nTransform the first parabola by adding or subtracting the desired y vertex point to the right side of the equation.\r\ny = (x−5)² - 7	\N	PBL_ans_75_6.PNG	\N	\N	\N	\N
697	7	75	Find an equation for each of the functions graphed at right. Each one is either an absolute-value function or a quadratic function.		2014-08-23 16:33:51.40287	2014-08-23 16:42:53.546874	y = |x-2| - 1\r\ny = 1/2(x²+2) - 1\r\ny = -}x-1|\r\ny = -(x-1)²	PBL_graph_75_7.PNG	PBL_ans_75_7.PNG	\N	\N	\N	\N
698	8	75	Without using a calculator, simplify |−√17+4|+7 by writing an equivalent expression without absolute-value signs. Do the same for |−√17−4|−5. Does your calculator agree?		2014-08-23 16:54:35.643077	2014-08-23 16:54:35.643077	|−√17+4|+7  ->  7−√17+4  or 7+√17-4   ->   11-√17 or 3+√17\r\nno, it only gives one of the two possible values.	\N	\N	\N	\N	\N	\N
699	1	76	The driver of a red sports car, moving at r feet per second, sees a pedestrian step out into the road. Let d be the number of feet that the car travels, from the moment when the driver sees the danger until the car has been brought to a complete stop. The equation d = 0.75r + 0.03r² models the typical panic-stop relation between stopping distance and speed. It is based on data gathered in actual physical simulations. Use it for the following:\r\n(a) Moving the foot from the accelerator pedal to the brake pedal takes a typical driver three fourths of a second. What does the term 0.75r represent in the stopping-distance equation? The term 0.03r² comes from physics; what must it represent?\r\n(b) How much distance is needed to bring a car from 30 miles per hour (which is equivalent to 44 feet per second) to a complete stop?\r\n(c) How much distance is needed to bring a car from 60 miles per hour to a complete stop?\r\n(d) Is it true that doubling the speed of the car doubles the distance needed to stop it?		2014-08-23 17:04:06.629203	2014-08-23 17:04:06.629203	a) The .75r is the distance traveled in the 3/4 of a second while the driver moves his foot.\r\n   The 0.03r² is the distance traveled once the brake is applied.\r\nb) d = 0.75r + 0.03r²  ->  d = 33 + .03(1936)  ->   d = 91.08 feet\r\nc) d = 0.75r + 0.03r²  ->  d = 66 + .03(7744)  ->   d = 298.32 feet\r\nd) no, doubling the speed more than triples the stopping distance.	\N	\N	\N	\N	\N	\N
700	2	76	(Continuation) At the scene of a crash, an officer observed that a car had hit a wall 150 feet after the brakes were applied. The driver insisted that the speed limit of 45 mph had not been broken. What do you think of this evidence?		2014-08-23 17:14:15.589978	2014-08-23 17:14:15.589978	45 mph would be 66 feet per second.\r\nd = .75(66) + .03(66²)\r\nd = 49.5 + 130.68 = 180.18\r\nAt 45 mph the stopping distance would be expected to be about 180 feet. We drop out the 49.5 feet before the brakes are applied and the car travels 130.68 feet. So if it was going at 45 mph it should not have hit the wall if the brakes were functioning properly. 	\N	\N	\N	\N	\N	\N
701	3	76	Consider the triangular arrangements of hearts shown below:\r\n(a) In your notebook, continue the pattern by drawing the next triangular array.\r\n(b) Let x equal the number of hearts along one edge of a triangle, and let y equal the corresponding number of hearts in the whole triangle. Make a table of values that illustrates the relationship between x and y for 1 ≤ x ≤ 6. What value of y should be associated with x = 0?\r\n(c) Is the relationship between x and y linear? Explain. Is the relationship quadratic? Explain. \r\n(d) Is y a function of x? Is x a function of y? Explain.\r\n(e) The numbers 1, 3, 6, 10, ... are called triangular numbers. Why? Find an equation for the triangular number relationship. Check it by replacing x with 6. Do you get the same number as there are hearts in the 6th triangle?		2014-08-23 20:13:45.365104	2014-08-23 20:13:45.365104	a) attached\r\nb) x  1  2  3   4    5    6\r\n   y  1  3  6  10   15   21\r\nWhen x is 0 y is 0.\r\nc) It is not linear, y goes up faster than x. It has a quadratic shape but is made of integers.\r\nd) Y is a function of x, the value of x determines the value of y uniquely, and the same can be said in reverse.\r\ne) They form the shape of a triangle when written as in the diagram.\r\nThe formula is (x²+x)/2\r\n(36+6)/2 = 21, yes, that's the same number of hearts.\r\n	\N	PBL_ans_76_3.PNG	\N	\N	\N	\N
702	4	76	If a hen and a half can lay an egg and a half in a day and a half, then how much time is needed for three hens to lay three eggs? 		2014-08-23 20:28:30.958934	2014-08-23 20:28:30.958934	1.5 hens lay 1.5 eggs in 1.5 days.\r\n3 hens lay 3 eggs in 1.5 days.\r\nRate for 1 hen for 1 day is eggs/(days*hens) ->  1.5/(1.5*1.5) or .67 eggs per day\r\ncheck: .67 eggs per day * 1.5 chickens * 1.5 days = 1.5 eggs	\N	\N	\N	\N	\N	\N
703	5	76	The equation y = 50x−0.5x² describes the trajectory of a toy rocket, in which x is the number of feet the rocket moves horizontally from the launch, and y is the corresponding number of feet from the rocket to the ground. The rocket has a sensor that causes a parachute to be deployed when activated by a laser beam.\r\n(a) If the laser is aimed along the line y = 20x, at what altitude will the parachute open?\r\n(b) At what slope could the laser be aimed to make the parachute open at 1050 feet?		2014-08-23 20:56:17.013457	2014-08-23 20:56:17.013457	a) 20x = 50x−0.5x²\r\n0 = 30x-0.5x²\r\nx(30-0.5x) = 0\r\n0.5x = 30  (discard x = 0 as not relevant)\r\nx = 60 feet horizontally, which is 1200 vertical feet\r\nb) 1050 = 50x−0.5x²\r\n−0.5x²+50x-1050 = 0 \r\nx²-100x+2100 = 0\r\n(x-30)(x-70) = 0\r\nx = 70 feet is where the line has to meet the parabola\r\nslope is 1050/70 or 15\r\n\r\n	\N	\N	\N	\N	\N	\N
704	1	77	Perform the indicated operations and combine like terms where possible:\r\n(a) (x + 6)(x − 7) (b) (x − 5)² (c) (x + 9)(x − 9)		2014-08-23 20:58:46.420491	2014-08-23 20:58:46.420491	(a) (x + 6)(x − 7)  ->  x² - x - 42\r\n(b) (x − 5)²        ->  x² - 10x + 25\r\n(c) (x + 9)(x − 9)  ->  x² - 81	\N	\N	\N	\N	\N	\N
707	4	77	The PEA Ski Club is planning a ski trip for the upcoming long weekend. They have 40 skiers signed up to go, and the ski resort is charging $120 for each person. \r\n(a) Calculate how much money (revenue) the resort expects to take in.\r\n(b) The resort manager offers to reduce the group rate of $120 per person by $2 for each additional registrant, as long as the revenue continues to increase. For example, if five more skiers were to sign up, all 45 would pay $110 each, producing revenue $4950 for the resort. Fill in the table and advise the manager.\r\n(c) Let x be the number of new registrants. In terms of x, write expressions for the total number of persons going, the cost to each, and the resulting revenue for the resort.\r\n(d) Plot your revenue values versus x, for the relevant values of x. Because this is a discrete problem, it does not make sense to connect the dots.\r\n(e) For the resort to take in at least $4900, how many PEA skiers must go on trip?	4800	2014-08-23 23:42:21.854361	2014-08-23 23:44:23.83196	a) $4,800\r\nb) extras  persons  cost/person  revenue\r\n     0       40        120        4800 \r\n     1       41        118        4838\r\n     2       42        116        4872\r\n     3       43        114        4902\r\n     4       44        112        4928\r\n     5       45        110        4950\r\n     6       46        108        4968\r\n     7       47        106        4982\r\n     8       48        104        4992\r\n     9       49        102        4998\r\n    10       50        100        5000\r\n    11       51         98        4998\r\n    12       52         96        4992\r\nEven with 12 extra people his revenue is still above 4800.\r\nc) (x+40),(120-2x),-2x²+40x+4800\r\nd) attached\r\ne) between 43 and 57	PBL_graph_77_4.PNG	PBL_ans_77_4.PNG	\N	\N	\N	\N
708	5	77	The diagram at the right suggests an easy way of making a box with no top. Start with a square piece of cardboard, cut squares of equal sides from the four corners, and then fold up the sides. Here is the problem: To produce a box that is 8 cm deep and whose capacity is exactly one liter (1000 cc). How large a square must you start with (to the nearest mm)?		2014-08-23 23:48:25.082482	2014-08-23 23:48:25.082482	8x² = 1000\r\nx² = 125\r\nx = 11.2 cm\r\ncheck: 11.2*11.2*8 = 1003.52	PBL_graph_77_5.PNG	\N	\N	\N	\N	\N
709	6	77	The area of a rectangle is 12 square feet, and each of its dimensions is an integral number of feet. What are the dimensions of all the possible rectangles that could have this area? What are all the integral factors of 12?		2014-08-23 23:49:55.283582	2014-08-23 23:49:55.283582	1 x 12, 2 x 6, 3 x 4\r\n1,2,3,4,6,12	\N	\N	\N	\N	\N	\N
710	1	78	Use the distributive property to multiply (x+p)(x+q). The result of this multiplication can be expressed in the form x² + ∇x + Δ; what do ∇ and Δ stand for?		2014-08-23 23:52:36.720324	2014-08-23 23:52:36.720324	(x+p)(x+q)  ->  x² + x(p + q) + pq\r\n∇ is p + q\r\nΔ is pq\r\n	\N	\N	\N	\N	\N	\N
711	2	78	(Continuation) When attempting to factor x²+5x+4 into a product of two binomials of the form (x+p)(x+q), Dylan set up the identity x2 +5x+4 = (x+ )(x+ ). Using a trial-and-error process, try to figure out what numbers go in the blank spaces. What is the connection between the numbers in the blank spaces and the coefficients 5 and 4 in the quadratic expression being factored?		2014-08-23 23:55:37.258668	2014-08-23 23:55:37.258668	x² + 5x + 4 = (x + 1)(x + 4)\r\np and q must add to 5 and multiply to 4, such as 1 and 4	\N	\N	\N	\N	\N	\N
712	3	78	(Continuation) Use the same trial-and-error process to express each of the following trinomials as a product of two binomials:\r\n(a) x² + 6x + 5 (b) x² − 7x + 12 (c) x² + 3x − 4 (d) x² − x − 6		2014-08-23 23:58:26.651744	2014-08-23 23:58:26.651744	(a) x² + 6x + 5   -> (x + 1)(x + 5)\r\n(b) x² − 7x + 12  -> (x - 4)(x - 3)\r\n(c) x² + 3x − 4   -> (x + 4)(x - 1)\r\n(d) x² − x − 6    -> (x - 3)(x + 2)	\N	\N	\N	\N	\N	\N
713	4	78	Solve the following quadratic equations:\r\n(a) x² + 6x + 5 = 0 (b) x² − 7x + 12 = 0 (c) x² + 3x − 4 = 0 (d) x² − x − 6 = 0		2014-08-24 00:02:46.807252	2014-08-24 00:02:46.807252	(a) x² + 6x + 5 = 0   -> (x + 1)(x + 5)  -> x = -1 or x = -5\r\n(b) x² − 7x + 12 = 0  -> (x - 3)(x - 4)  -> x =  3 or x =  4  \r\n(c) x² + 3x − 4 = 0   -> (x + 4)(x - 1)  -> x =  1 or x = -4  \r\n(d) x² − x − 6 = 0    -> (x + 2)(x - 3)  -> x = -2 or x =  3 	\N	\N	\N	\N	\N	\N
717	7	78	When taking an algebra quiz, Dale was asked to factor the trinomial x² + 3x + 4. Dale responded that this particular trinomial was not factorable. Decide whether Dale was correct, and justify your response.		2014-08-24 02:38:17.141173	2014-08-24 02:38:17.141173	You would need two numbers that multiply to 4 and add to 3. That isn't possible as 1 and 4, or 2 and 2 both have to add to greater than 3.	\N	\N	\N	\N	\N	\N
719	9	78	Find an equation for the parabola whose x-intercepts are 0 and 8, whose axis of symmetry is parallel to the y-axis, and whose vertex is at\r\n(a) (4,−16) (b) (4,−8) (c) (4,−4) (d) (4, 16)		2014-08-24 02:52:27.859396	2014-08-24 02:52:27.859396	a) y = x² - 8x\r\nb) y = .5x²-4x\r\nc) y = .25x² - 2x\r\nd) y = -x² + 8x\r\n	\N	\N	\N	\N	\N	\N
720	10	78	Find the value for c that forces the graph of 3x + 4y = c to go through (2,−3).		2014-08-24 02:55:05.067004	2014-08-24 02:55:05.067004	3*2 + 4*-3 = c\r\n6 - 12 = c\r\nc = -6	\N	\N	\N	\N	\N	\N
718	8	78	The graph of a quadratic function intersects the x-axis at 0 and at 8. Draw two parabolas that fit this description and find equations for them. How many examples are possible?		2014-08-24 02:46:09.903293	2014-08-24 03:05:38.263198	y = -x² + 6x\r\ny = x² - 6x\r\ny = 2x² - 12x\r\nThere are an infinite number of such graphs.	\N	PBL_ans_78_8.PNG	\N	\N	\N	\N
737	9	80	The product of two polynomials is also a polynomial. Explain. When a polynomial of degree 3 is multiplied by a polynomial of degree 2, what is the degree of the result?		2014-08-25 04:00:58.899984	2014-08-25 04:00:58.899984	Using the distributive property an new expression is formed that has to be a polynomial since each of its terms will be either monomials or polynomials.\r\nThe degree will be 6.	\N	\N	\N	\N	\N	\N
716	6	78	Without using a calculator, make a sketch of the parabola y = (x − 50)² − 100, by finding the x-intercepts, the y-intercept, and the coordinates of the vertex. Label all four points with their coordinates on your graph.		2014-08-24 02:34:17.58251	2014-08-24 03:06:50.4622	y = (x − 50)² − 100\r\n0 = (x − 50)² − 100\r\n(x − 50)² = 100\r\nx - 50 = ±10\r\nx intercepts = 40, 60\r\ny = (50 − 50)² − 100\r\nvertex = (50,-100)\r\ny = (-50)² - 100\r\ny intercept is 2400	\N	PBL_ans_78_6.PNG	\N	\N	\N	\N
736	8	80	A cylindrical container is filled to a depth of d cm by pouring in V cc of liquid. Draw a plausible graph of d versus V .		2014-08-25 03:58:50.761285	2014-08-25 04:04:06.942524	d = V * πr²\r\nlet V be 25, y = 25 * πr²	\N	PBL_ans_80_8.PNG	\N	\N	\N	\N
732	4	80	Combine into one fraction:\r\n(a) 1/3 + 1/7  (b) 1/15 + 1/19  (c) 1/(x − 2) + 1/(x + 2)\r\nEvaluate your answer to part (c) with x = 5 and x = 17. How do these answers compare to your answers in parts (a) and (b)?		2014-08-25 01:44:27.465205	2014-08-25 05:32:14.628919	(a) 1/3 + 1/7              ->   7/21 + 3/21 = 10/21\r\n(b) 1/15 + 1/19            ->  19/285 + 15/285 = 34/285\r\n(c) 1/(x − 2) + 1/(x + 2)  ->  x+2/(x²-4) +  x-2/(x²-4)  ->  2x/(x²-4)\r\n(2*5)/(25-4) = 10/21\r\n(2*17)/(289-4) = 34/285	\N	\N	\N	\N	\N	\N
803	7	87	(Continuation) Plot the points (1, 2), (2, 5), and (3, 8) on the coordinate plane. Write equations, similar to those in the preceding exercise, that produce these points when t- values are assigned. There is more than one correct answer.		2014-08-31 02:48:48.66192	2014-08-31 02:49:41.410625	X = 1 + t\r\ny = 2 + 3t	\N	PBL_ans_87_7.PNG	\N	\N	\N	\N
820	4	89	Complete the following, without using any variable names: Given two points in a coordinate plane, you find the distance between them by : : :		2014-08-31 17:11:15.003167	2014-08-31 17:11:15.003167	taking the square root of the sum of squares of the distance between the x values and the distance between the y values.	\N	\N	\N	\N	\N	\N
721	1	79	Pat and Kim own a rectangular house that measures 50 feet by 30 feet. They want to add on a family room that will be square, and then fill in the space adjoining the new room with a deck. A plan of the setup is shown at right. They have not decided how large a family room to build, but they do have 400 square feet of decking. If they use it all, and keep to the plan, how large will the family room be? Is there more than one solution to this problem?		2014-08-24 03:03:23.586958	2014-08-24 03:03:23.586958	Deck is x by 50 - x, so it's area is 50x - x² = 400\r\nx² - 50x + 400 = 0\r\n(x - 10)(x - 40) = 0\r\nThere are 2 solutions, the family room could be 10x10, or 40x40. In the first case the deck is 10x40, and in the second case the deck is 40x10.\r\n	PBL_graph_79_1.PNG	\N	\N	\N	\N	\N
714	5	78	The three functions y = 2(x − 4) − 1, y = 2|x − 4| − 1, and y = 2(x − 4)² − 1 look somewhat similar. Predict what the graph of each will look like, and then sketch them in your notebook (without using a calculator) by just plotting a few key points. In each case think about how the form of the equation can help provide information.		2014-08-24 02:21:25.52736	2014-08-24 03:07:50.239933	y = 2(x − 4) − 1, will be a line with -9 as the y intercept and 4.5 as the x intercept\r\ny = 2|x − 4| − 1, will be a line like the above only it will make a 90 degree bend when x is 4\r\ny = 2(x − 4)² − 1, will be a parabola with a vertex at (4,-1)	\N	PBL_ans_78_5.PNG	\N	\N	\N	\N
722	2	79	Write in as compact form as possible:\r\n(a) x^4 · 1/x^3 (b) (2/x^3)^4 (c) (2x + x + 2x)^3 (d) x^6/x²		2014-08-24 20:44:02.778217	2014-08-24 20:44:02.778217	(a) x^4 · 1/x^3        ->  x\r\n(b) (2/x^3)^4          ->  16/x^12\r\n(c) (2x + x + 2x)^3    -> 125z^3\r\n(d) x^6/x²             ->  x^4	\N	\N	\N	\N	\N	\N
723	3	79	Write each of the following quadratic functions in factored form. Without using your calculator, find x-intercepts for each function and use the intercepts to sketch a graph. Include the coordinates for each vertex.\r\n(a) y = x² − 4x − 5 (b) y = x² + 12x + 35 (c) y = x² − 3x + 2		2014-08-24 21:01:05.722779	2014-08-24 21:01:05.722779	(a) y = x² − 4x − 5    ->  (x - 5)(x + 1), x intercepts are 5 and -1, 4-8-5 = -9, vertex is (2, -9)\r\n(b) y = x² + 12x + 35  ->  (x + 5)(x + 7), x intercepts are -5 and -7, 36-72+35= -1, vertex is (-6, -1)\r\n(c) y = x² − 3x + 2    ->  (x - 1)(x - 2), x intercepts are 1 and 2, 2.25 - 4.5 + 2 = -0.25, vertex is (1.5, -0.25)	\N	PBL_ans_79_3.PNG	\N	\N	\N	\N
724	4	79	(Continuation) In the previous problem, expressing a polynomial in factored form made it relatively easy to graph the polynomial function. Here we explore the process in reverse; that is, try using the graph of a polynomial function to factor the polynomial. In particular, graph y = x³ −3x² −x+3 on your calculator, and from that graph deduce the factored form.		2014-08-24 21:04:44.263772	2014-08-25 00:42:49.244492	(x+1)(x-1)(x-3)  -> (x² -4x + 3)(x +1) ->  x^3 + -4x² + x² + 3x - 4x + 3  -> x³ −3x² −x+3	\N	PBL_ans_79_4.PNG	\N	\N	\N	\N
725	5	79	By using square roots, express the solutions to (x−5)² −7 = 0 exactly (no decimals).		2014-08-25 00:44:54.421332	2014-08-25 00:44:54.421332	(x−5)² 7\r\nx - 5 = ±√7\r\nx = 5±√7	\N	\N	\N	\N	\N	\N
726	6	79	By rearranging the two parts of the diagram shown at right, show that a² − b² is equivalent to (a + b)(a − b).		2014-08-25 01:10:58.656054	2014-08-25 01:10:58.656054		PBL_graph_79_6.PNG	\N	\N	\N	\N	\N
727	7	79	Expand the following products:\r\n(a) (x − 4)(x + 4) (b) (x + 7)(x − 7) (c) (3x − 2)(3x + 2)\r\nUse the pattern to predict the factors of x² − 64 and 4x² − 25.\r\nExplain why this pattern is called the 'difference of two squares'.	Both the left and the right hand terms are perfect squares.	2014-08-25 01:14:35.300542	2014-08-25 01:14:35.300542	(a) (x − 4)(x + 4)    -> x²-16\r\n(b) (x + 7)(x − 7)    -> x²-49\r\n(c) (3x − 2)(3x + 2)  -> 9x²-4	\N	\N	\N	\N	\N	\N
728	8	79	Find the x-intercepts of the following graphs, without expanding the squared binomial that appears in each:\r\n(a) y = (x − 4)² − 9 (b) y = −2(x + 3)² + 8\r\nCheck your work by sketching each parabola, incorporating the vertex and x-intercepts.		2014-08-25 01:26:30.616025	2014-08-25 01:26:30.616025	(a) 0 = (x − 4)² − 9   ->  x - 4 = ±3   ->  x = 1 or x = 7\r\n(b) 0 = −2(x + 3)² + 8 ->  0 = 4(x+3)² - 16  ->  2x + 6 ->  = ±4  -> 2x = -10  or 2x = -2  ->   x = -5 or x = -1	\N	PBL_ans_79_8.PNG	\N	\N	\N	\N
729	1	80	The 'degree' of a monomial counts how many variable factors would appear if it were written without using exponents. For example, the degree of 6ab is 2, and the degree of 25x3 is 3, since 25x³ = 25xxx. The degree of a polynomial is the largest degree found among its monomial terms. Find the degree of the following polynomials:\r\n(a) x² − 6x (b) 5x³ − 6x² (c) x^4 + 4x³y + 6x²y2 + 4xy³ + y^4 (d) 4r²h		2014-08-25 01:33:17.53062	2014-08-25 01:33:17.53062	a) x² − 6x      degree is 2\r\n(b) 5x³ − 6x²      degree is 3 \r\n(c) x^4 + 4x³y + 6x²y² + 4xy³ + y^4   degree is 4\r\n(d) 4r²h      degree is 3	\N	\N	\N	\N	\N	\N
730	2	80	Find at least three integers (positive or negative) that, when put in the blank space, make the expression x² + ___x − 36 a factorable trinomial. Are there other examples? How many?		2014-08-25 01:37:19.548596	2014-08-25 01:37:19.548596	0 (6,-6)\r\n9 (12, -3)\r\n16 (18, -2)\r\nAlso:\r\n5 (9, -4)\r\n-5 (4, -9)\r\n-9 (3, -12)\r\n-16 (-18, 2)\r\n7 total.	\N	\N	\N	\N	\N	\N
731	3	80	(Continuation) Find at least three integers that, when put in the blank space, make the expression x² + 4x − a factorable trinomial. Are there other examples? How many? What do all these integers have in common?		2014-08-25 01:40:22.568513	2014-08-25 01:40:22.568513	5, -1\r\n6, -2\r\n8, -4\r\nThere are an infinite number, all of them combine to equal 4.	\N	\N	\N	\N	\N	\N
733	5	80	Plot a point near the upper right corner of a sheet of graph paper. Move your pencil 15 graph-paper units (squares) to the left and 20 units down, then plot another point. Use your ruler to measure the distance between the points. Because the squares on your graph paper are probably larger or smaller than the squares on your classmates’ graph paper, it would not be meaningful to compare ruler measurements with anyone else in class. You should therefore finish by converting your measurement to graph-paper units.		2014-08-25 03:31:06.65545	2014-08-25 03:31:06.65545	25 cm	\N	\N	\N	\N	\N	\N
734	6	80	(Continuation) Square your answer (in graph-paper units), and compare the result with the calculation 152 + 202.		2014-08-25 03:47:00.613362	2014-08-25 03:47:00.613362	They are equal.	\N	\N	\N	\N	\N	\N
735	7	80	(Continuation) Repeat the entire process, starting with a point near the upper left corner, and use the instructions “20 squares to the right and 21 squares down.” You should find that the numbers in this problem again fit the equation a²+b² = c². These are instances of the 'Pythagorean Theorem', which is a statement about right-angled triangles. Write a clear statement of this useful result. You will need to refer to the longest side of a right triangle, which is called the 'hypotenuse'.		2014-08-25 03:49:34.928296	2014-08-25 03:49:34.928296	29 cm.\r\nThe square of the hypotenuse is equal to the sum of the squares of the other two sides.	\N	\N	\N	\N	\N	\N
738	1	81	When asked to find the equation of the parabola pictured at right, Ryan reasoned that the correct answer had to look like y = a(x − 2)² + 3, for some value of a. Justify Ryan’s reasoning, then finish the problem by finding the correct value of a.		2014-08-25 04:03:43.251557	2014-08-25 04:23:56.878605	The vertex being (2,3) means -2 would be needed to make the x² term so that y will equal 3 at that point.\r\nThe y intercept is 1, meaning a(-2)² + 3 = 1  ->  4a = -2  ->  a = -1/2\r\ny = -0.5(x-2)+3	PBL_graph_81_1.PNG	PBL_ans_81_1.PNG	\N	\N	\N	\N
739	2	81	Find an equation for the parabola whose symmetry axis is parallel to the y-axis, whose vertex is (−1, 4), and whose graph contains the point (1, 3).		2014-08-25 04:32:33.087541	2014-08-25 04:32:33.087541	y = a(x + 1)² + 4\r\n3 = 4a + 4\r\n4a = -1\r\na = -1/4\r\ny = -1/4(x+1) + 4\r\n	\N	PBL_ans_81_2.PNG	\N	\N	\N	\N
740	3	81	Starting at school, you and a friend ride your bikes in different directions — you ride 4 blocks north and your friend rides 3 blocks west. At the end of this adventure, how far apart are you and your friend?		2014-08-25 04:33:35.409997	2014-08-25 04:33:35.409997	5 blocks apart (√(9+16) -> √25	\N	\N	\N	\N	\N	\N
741	4	81	From the library, you ride your bike east at a rate of 10 mph for half an hour while your friend rides south at a rate of 15 mph for 20 minutes. How far apart are you? How is this problem similar to the preceding problem? How do the problems differ?		2014-08-25 04:36:09.800089	2014-08-25 04:37:21.088289	10*1/2 = 5 miles\r\n15*1/3 = 5 miles\r\n√50 = about 7.1 miles\r\nThere is a time element involved, although it ends up similar to the previous problem as the end result is distances for both riders.\r\nAlso a right triangle, but not one that comes out even.	\N	\N	\N	\N	\N	\N
742	5	81	A small calculator company is doing a study to determine how to price one of its new products. The theory is that the revenue, r, from a product is a function of the market price p, and one of the managers has proposed that the quadratic model r = p·(3000−10p) provides a realistic approximation to this function.\r\n(a) Given that revenue = (price)(quantity), what does the factor 3000 − 10p represent?\r\n(b) What is the significance of the value p = 300 in this investigation?\r\n(c) Assume that this model is valid, and figure out the optimal price to charge for the calculator. How much revenue for the company will the sales of this calculator provide?\r\n(d) If the management is going to be satisfied as long as the revenue from the new calculator is at least $190000, what range of prices p will be acceptable?		2014-08-25 05:15:14.204921	2014-08-25 05:15:14.204921	a) 3000 − 10p is the quantity to be manufactured, a maximum of 3000 units.\r\nb) At a price of 300 the quantity becomes zero an no units are manufactured\r\nc) The vertex has an x value of 150, halfway between 0 and 300, thus $150 will be the optimum price\r\nr = -150² + 3000*150\r\nr = 450000 - 22500, revenue is $427,500.\r\nd) 190000 = -10p² + 3000*p\r\n-p² + 300p - 19000 = 0\r\nbetween 90 and 210 units\r\n	\N	\N	\N	\N	\N	\N
743	6	81	Imagine a circle of rope, which has twelve evenly spaced knots tied in it. Suppose that this rope has been pulled into a taut, triangular shape, with stakes anchoring the rope at knots numbered 1, 4, and 8. Make a conjecture about the angles of the triangle.		2014-08-25 05:18:57.108335	2014-08-25 05:18:57.108335	Since the sides will be 3, 4, and 5, it will be a right triangle so one of the angles will be 90 and the other two will be less than 90.	\N	\N	\N	\N	\N	\N
744	7	81	Combine over a common denominator: (a) 1/(x − 3) + 2/x (b) 1/(x − 3) + 2(x + 3)		2014-08-25 05:23:00.765726	2014-08-25 05:34:12.085469	(a) 1/(x − 3) + 2/x      ->  (3x - 6)/(x² - 3x)\r\n(b) 1/(x − 3) + 2(x + 3) -> (3x-3)/(x² - 9)	\N	\N	\N	\N	\N	\N
745	8	81	The diagram at right shows the flag of Finland, which consists of a blue cross, whose width is a uniform 9 inches, against a solid white background. The flag measures 2 feet 9 inches by 4 feet 6 inches. The blue cross occupies what fractional part of the whole flag?		2014-08-25 05:37:40.922586	2014-08-25 05:37:40.922586	24+9 = 33 inches high\r\n48+5 = 54 inches wide\r\ntotal area = 1782 sq. in.\r\nblue cross = 9x54 = 486 + 9*12 = 594 sq. in.\r\n33.33%\r\n	\N	\N	\N	\N	\N	\N
746	1	82	In baseball, the infield is a square that is 90 feet on a side, with bases located at three of the corners, and home plate at the fourth. If the catcher at home plate can throw a baseball at 70 mph, how many seconds does it take for the thrown ball to travel from home plate to 2nd base?		2014-08-25 05:41:40.960158	2014-08-25 05:42:22.635426	√(8100*2) = 127.28 feet\r\n70 mph = 102.67 feet per second\r\n127.28/102.28 = 1.24 seconds	PBL_graph_82_1.PNG	\N	\N	\N	\N	\N
747	2	82	Graph the equation y = (x−5)² −7 without a calculator by plotting its vertex and its x-intercepts (just estimate their positions between two consecutive integers). Then use your calculator to draw the parabola. Repeat the process on y = −2(x+6)²+10.		2014-08-25 13:56:05.980895	2014-08-25 13:56:05.980895	0 = (x−5)² −7\r\n(x−5)² = 7\r\nx - 5 = ±√7, √7 ~ 2.6\r\ny intercepts (2.4,0), (7.6,0)\r\nvertex (5, -7)\r\n0 = −2(x+6)²+10\r\n0 = (x+6)²-5\r\nx = -6±√5  y intercepts (-3.8,0),(-8.2,0)\r\nvertex (-6,10)\r\n\r\n	\N	PBL_ans_82_2.PNG	\N	\N	\N	\N
748	3	82	At most how many solutions can a quadratic equation have? Give an example of a quadratic equation that has two solutions. Give an example of a quadratic equation that has only one solution. Give an example of a quadratic equation that has no solutions.		2014-08-25 17:40:29.504881	2014-08-25 17:40:29.504881	At most 2, where, for example, the vertex is below the x axis and you are solving for y = 0. 0 = (x-2)²-5\r\nA quadratic will have one solution at the vertex, for example, x² + 2x = -1, which is (x+1)² = 0, hence only -1 as solution.\r\nA quadratic will have no solutions if the solution results in a square root being negative, i.e. -x² = 2\r\n	\N	\N	\N	\N	\N	\N
749	4	82	While flying a kite at the beach, you notice that you are 100 yards from the kite’s shadow, which is directly beneath the kite. You also know that you have let out 150 yards of string. How high is the kite?		2014-08-25 17:45:26.048986	2014-08-25 17:45:26.048986	150² - 100² = x²\r\nx = √12500 = 111.8 yards	PBL_graph_82_4.PNG	\N	\N	\N	\N	\N
750	5	82	Starting from home, Jamie haphazardly walks 2 blocks north, 3 blocks east, 1 block north, 3 blocks east, 1 block north, 5 blocks east, and 1 block north. How far is Jamie from home if each block is 150 meters long?		2014-08-25 17:53:18.928399	2014-08-25 17:53:18.928399	√(1650²+750²) = √3,295.000 = 1812.5 yards	\N	PBL_ans_82_5.PNG	\N	\N	\N	\N
751	6	82	The sides of Fran’s square are 5 cm longer than the sides of Tate’s square. Fran’s square has 225 sq cm more area. What is the area of Tate’s square?		2014-08-25 17:56:52.53306	2014-08-25 17:56:52.53306	x² + 225 = (x + 5)²\r\nx² + 225 = x² + 10x + 25\r\n10x + 25 = 225\r\n10x = 200\r\nx = 20 cm for Tate's square, Fran's square is 25\r\ncheck:  400+225 = 625	\N	\N	\N	\N	\N	\N
752	7	82	In the figure at right, BAD is a right angle, and C is the midpoint of segment AB. Given the dimensions marked in the figure, find the length of CD.		2014-08-25 18:02:08.611844	2014-08-25 18:02:08.611844	√(676-576) = √100 = 10\r\nAB is 10, thus AC is 5.\r\n√(576+25) = √601 = 24.52	PBL_graph_82_7.PNG	\N	\N	\N	\N	\N
770	6	84	Evaluate √(x + y)² using x = 24 and y = 10. Is √(x + y)² equivalent to x + y?\r\nExplain		2014-08-30 03:58:33.180038	2014-08-30 03:58:33.180038	34² = 1156, not surprisingly the square root of that is 34. By definition √(x + y)² equivalent to x + y.	\N	\N	\N	\N	\N	\N
771	7	84	Evaluate √(x + y)² using x = −24 and y = 10. Is √(x + y)² equivalent to x + y?\r\nExplain.		2014-08-30 04:35:17.239852	2014-08-30 04:35:17.239852	-14² = 196, which doesn't equal √196, which is 14. \r\n√(x + y)² equivalent to x + y only when both x and y are positive.	\N	\N	\N	\N	\N	\N
753	8	82	Graph the three points (−2, 1), (3, 1), and (0, 7). There is a quadratic function whose graph passes through these three points. Sketch the graph. Find its equation in two ways: First, begin with the equation y = ax²+bx+c and use the three points to find the values of a, b, and c. (One of these values is essentially given to you.) Second, begin with the equation y = a(x−h)²+k and use the three points to determine a, h, and k. (One of these values is almost given to you.) Your two equations do not look alike, but they should be equivalent. Check that they are.		2014-08-25 18:43:04.272669	2014-08-25 18:43:04.272669	y = ax²+bx+c, c must be 7 since that's the y value when x is 0.\r\n   1 = 4a-2b+7\r\n   1 = 9a+3b+7\r\n   2 = 18a+6b+14\r\n   3 = 12a-6b+21\r\n+  5 = 30a + 35\r\n   a = -1\r\n   1 = -4-2b+7\r\n  -6 = -4-2b\r\n  -2 = -2b\r\n   b = 1\r\ny = -x²+x+7\r\n\r\n   y = a(x−h)²+k\r\nThe axis of symmetry is .5, which means h = .5\r\n   7 =  0.25a + k\r\n   1 =  6.25a + k\r\n-  6 =  -6a\r\n   a = -1\r\n   1 = -6.25 + k\r\n   k = 7.25\r\n\r\n \r\n\r\n\r\n	\N	PBL_ans_82_8.PNG	\N	\N	\N	\N
754	9	82	Is it possible for a rectangle to have a perimeter of 100 feet and an area of 100 square feet? Justify your response.		2014-08-25 18:55:04.216794	2014-08-25 18:55:04.216794	Two contiguous sides have to add to 50 for the perimeter to be 100.\r\nSo x*y = 100 and y = 50 - x\r\nx(50-x) = 100\r\n- x² + 50x - 100 = 0\r\nx² - 50x + 100 = 0\r\nYes it is possible, 3*47 = 141, 2*48 = 96 so the answer is somewhere between 2-3 and 47-48 feet for width and length.\r\n\r\n	\N	\N	\N	\N	\N	\N
755	1	83	Solve each of the following by the method of completing the square:\r\n(a) 3x² − 6x = 1 (b) 2x² + 8x − 17 = 0		2014-08-25 19:02:09.65255	2014-08-25 19:02:09.65255	(a) 3x² − 6x = 1 \r\n     x² − 2x = 1/3\r\n     x² − 2x + 1 = 4/3\r\n     (x-1)² = 4/3\r\n      x-1 = ±2√3/3\r\n      x = 1±2√3/3\r\n(b) 2x² + 8x − 17 = 0\r\n     x² + 4x = 17/2\r\n     x² + 4x + 4 = 17/2\r\n    (x + 2)² = ±√(17/2)\r\n     x = -2±√(17/2	\N	\N	\N	\N	\N	\N
756	2	83	Find the x-intercepts of y = a(x − 6a)² − 4a³ in terms of a.\r\n		2014-08-25 23:18:48.881546	2014-08-25 23:18:48.881546	0 = a(x − 6a)² − 4a³\r\n0 = (x − 6a)²\r\n0 = ±(x − 6a)\r\nx = 6a or -x = -6a	\N	\N	\N	\N	\N	\N
757	3	83	The period of a pendulum is the time T it takes for it to swing back and forth once. This time (measured in seconds) can be expressed as a function of the pendulum length L, measured in feet, by the physics formula T = 1/4(π√(2L)).\r\n(a) To the nearest tenth of a second, what is the period for a 2-foot pendulum?\r\n(b) To the nearest inch, how long is a pendulum whose period is 2.26 seconds?		2014-08-25 23:28:21.681309	2014-08-25 23:28:21.681309	a) T = 1/4(π√(4))  ->  T = 1/4(2π) = 1.57 seconds\r\nb) 2.26 = 1/4(π√(2L)  ->  9.04 = π√(2L  ->  √2L = 2.88  ->  2L = 8.2944 feet, or 8 feet 4 inches.	\N	\N	\N	\N	\N	\N
758	3	83	The period of a pendulum is the time T it takes for it to swing back and forth once. This time (measured in seconds) can be expressed as a function of the pendulum length L, measured in feet, by the physics formula T = 1/4(π√(2L)).\r\n(a) To the nearest tenth of a second, what is the period for a 2-foot pendulum?\r\n(b) To the nearest inch, how long is a pendulum whose period is 2.26 seconds?		2014-08-25 23:32:08.868508	2014-08-25 23:32:08.868508	a) T = 1/4(π√(4))  ->  T = 1/4(2π) = 1.57 seconds\r\nb) 2.26 = 1/4(π√(2L)  ->  9.04 = π√(2L  ->  √2L = 2.88  ->  2L = 8.2944 feet, L = 4 feet 2 inches.	\N	\N	\N	\N	\N	\N
759	4	83	A football field is a rectangle, 300 feet long (from goal to goal) and 160 feet wide (from sideline to sideline). To the nearest foot, how far is it from one corner of the field (on one of the goal lines) to the furthest corner of the field (on the other goal line)?		2014-08-25 23:34:58.014309	2014-08-25 23:34:58.014309	√(300²+160²)\r\n√115600\r\n340 feet\r\n\r\n	\N	\N	\N	\N	\N	\N
760	5	83	Sam breeds horses, and is planning to construct a rectangular corral next to the barn, using a side of the barn as one side of the corral. Sam has 240 feet of fencing available, and has to decide how much of it to allocate to the width of the corral.\r\n(a) Suppose the width is 50 feet. What is the length?  How much area would this corral enclose?\r\n(b) Suppose the width is 80 feet. What is the enclosed area?\r\n(c) Suppose the width is x feet. Express the length and the enclosed area in terms of x.		2014-08-27 04:10:00.384282	2014-08-27 04:10:00.384282	a) 140 feet would be the length, area would be 7000 sq. feet\r\nb) 80 * 80 = 6400 sq. feet\r\nc) 240 - 2x, 240x - 2x²\r\n	PBL_graph_83_5.PNG	\N	\N	\N	\N	\N
761	6	83	(Continuation) Let y stand for the area of the corral that corresponds to width x. Notice that y is a quadratic function of x. Sketch a graph of y versus x. For what values of x does this graph make sense? For what value of x does y attain its largest value? What are the dimensions of the corresponding corral?		2014-08-27 04:15:17.242207	2014-08-27 04:15:17.242207	240x - 2x²\r\nIt makes sense only for positive values of x and y.\r\ny attains its largest value, 7200, when x is 60. That makes a corral with a width of 60 and a length of 120.	\N	PBL_ans_83_6.PNG	\N	\N	\N	\N
762	7	83	In each of the following, supply the missing factor:\r\n(a) 2x² + 5x − 12 = (2x − 3)( ) (b) 3x² − 2x − 1 = (3x + 1)( )\r\n(c) 4y² − 8y + 3 = (2y − 1)( ) (d) 6t² − 7t − 3 = (3t + 1)( )		2014-08-27 04:21:09.066553	2014-08-27 04:21:09.066553	(a) 2x² + 5x − 12 = (2x − 3)(x + 4) \r\n(b) 3x² − 2x − 1 = (3x + 1)(x - 1)\r\n(c) 4y² − 8y + 3 = (2y − 1)(2y - 3) \r\n(d) 6t² − 7t − 3 = (3t + 1)(2t - 3)	\N	\N	\N	\N	\N	\N
763	8	83	Which of the following calculator screens could be displaying the graph of y = x²−2x?		2014-08-27 04:23:13.772927	2014-08-27 04:23:13.772927	Has to open upwards, so d is out.\r\nHas to pas through the origin, so b is out.\r\na and d.	PBL_graph_83_8.PNG	\N	\N	\N	\N	\N
764	1	84	Refer to the diagram at right and find the value of x for which triangle ABC has a right angle at C.		2014-08-27 04:33:05.939552	2014-08-27 04:33:05.939552	 (2x + 1)² = x² + (2x - 1)²\r\n4x² + 4x + 1 = x² + 4x² - 4x + 1\r\n4x² + 4x + 1 = 5x² - 4x + 1\r\n           8x = x²\r\n            x = 8\r\nThe triangle has sides of 8,15, and 17\r\ncheck: 64+225 = 289 = 17²\r\n	\N	\N	\N	\N	\N	\N
765	2	84	The final digit of 3^6 is 9. What is the final digit of 3^2001?		2014-08-27 04:46:50.390318	2014-08-27 04:46:50.390318	3^1 = 3\r\n3^2 = 9\r\n3^3 = 27\r\n3^4 = 81\r\n3^5 = 243\r\n3^6 = 729\r\n3^7 = 2187\r\n3^8 = 6561\r\n3^9 = 19683\r\n3^10 = 59049\r\n3^11 = 177147\r\n3^12 = 541441\r\nExponents that divide evenly by 4 end in 1, so 3&2000 would end in 1, so 3^2001 would end in 3, 3^2002 would end in 9, and 3^2004 would end in 7.\r\n	\N	\N	\N	\N	\N	\N
766	3	84	The mathematician Augustus de Morgan enjoyed telling his friends that he was x years old in the year x2. Figure out the year of de Morgan’s birth, given that he died in 1871.		2014-08-30 03:46:47.821357	2014-08-30 03:46:47.821357	√1871 = 43.25\r\n√1849 = 43\r\n42² = 1764\r\nHe was 43 years old in 1849.\r\nThe year of Morgan's birth was 1806\r\n	\N	\N	\N	\N	\N	\N
767	4	84	(Continuation) Are there persons alive today who can truthfully make the same statement that de Morgan did?		2014-08-30 03:48:52.397181	2014-08-30 03:48:52.397181	44 in 1936 doesn't work as the person would be 122 years old.\r\n45 will work starting in 2025 for people born in 1980, but we're not there yet, so no.\r\n	\N	\N	\N	\N	\N	\N
768	4	84	(Continuation) Are there persons alive today who can truthfully make the same statement that de Morgan did?		2014-08-30 03:48:52.652688	2014-08-30 03:48:52.652688	44 in 1936 doesn't work as the person would be 122 years old.\r\n45 will work starting in 2025 for people born in 1980, but we're not there yet, so no.\r\n	\N	\N	\N	\N	\N	\N
769	5	84	Evaluate \r\n√(x² + y²) using x = 24 and y = 10. Is √(x² + y²) equivalent to x + y? Does the square-root operation “distribute” over addition?		2014-08-30 03:55:56.858071	2014-08-30 03:55:56.858071	24²+10² = 676\r\n√676 = 26 does not equal 34\r\n2² + 3² = 13\r\n√13 is about 3.6, not equal to 5\r\nThe square-root operation does not 'distribute' over addition.\r\n	\N	\N	\N	\N	\N	\N
774	10	84	Sketch the graphs of y = 3√x and y = x+2, and then find their points of intersection.\r\nNow solve the equation 3√x = x+2 by first squaring both sides of the equation. Do your answers agree with those obtained from the graph?		2014-08-30 05:07:30.935403	2014-08-30 05:07:30.935403	Points of intersection: (1,3), (4,6)\r\n3√x = x+2\r\n9x = x² + 4x + 4\r\n0 = x² - 5x + 4\r\n0 = (x - 1)(x - 4), x = 1 or x = 4\r\nYes, they agree.	\N	PBL_ans_84_10.PNG	\N	\N	\N	\N
775	11	84	The expression 4x + 3x can be combined into one term, but 4x + 3y cannot. Explain.\r\nCan 4√5 + 3√5 be combined into one term? Can √2 + √2 be combined into one term?\r\nCan √2 + √3 be combined into one term? At first glance, it may seem that √2 + √8 cannot be combined into one term. Take a close look at √8 and show that √2 + √ 8 can in fact be combined into one term.		2014-08-30 05:14:30.278428	2014-08-30 05:14:30.278428	The terms being added must be the same, x is the same as x but not the same as y.\r\n4√5 + 3√5 = 7√5, they can be combined as the radical is the same term.\r\n√2 + √2 can be combined, 2√2\r\n√2 + √3 can't be combined, different terms\r\n√2 + √8 can be combined since √8 is the same as √(2*2*2), so in total it would be 2√2 + √2, or 3√2.	\N	\N	\N	\N	\N	\N
776	12	84	I have been observing the motion of a really tiny red bug on my graph paper. When I started watching, the bug was at the point (3, 4). Ten seconds later it was at (5, 5). Another ten seconds later it was at (7, 6) After another ten seconds it was at (9, 7).\r\n(a) Draw a picture that illustrates what is happening.\r\n(b) Write a description of any pattern that you notice. What assumptions are you making?\r\n(c) Where was the bug 25 seconds after I started watching it?\r\n(d) Where was the bug 26 seconds after I started watching it?		2014-08-30 05:25:08.224936	2014-08-30 05:25:08.224936	a) attached\r\nb) the bug moves 2 units right in the x axis for each unit up on the y axis, assuming it continues to move at a constant rate and direction.\r\nc) (8,6.5)\r\nd) y = .5x + 2.5\r\n   y = .5*8.2 + 2.5\r\n   y = 4.1 + 2.5\r\n   y = 6.6\r\nThe bug was at (8.2, 6.6)\r\nTime equals 5(x-3), (8.2-3)*5 = 26 seconds	\N	PBL_ans_84_11.PNG	\N	\N	\N	\N
777	1	85	I am thinking of a right triangle, whose sides can be represented by x − 5, 2x, and 2x + 1. Find the lengths of the three sides.		2014-08-30 05:33:09.258228	2014-08-30 05:33:09.258228	(x − 5)² + 4x² = (2x + 1)²\r\n5x² - 10x + 25 = 4x² + 4x + 1\r\nx² - 14x + 24 = 0\r\n(x - 12) (x - 2) = 0\r\nx = 2 or x = 12\r\ncan't use 2 since it would make a negative side to the triangle, so the triangle is 7,24,25\r\ncheck: 49 + 576 = 625, √625 = 25	\N	\N	\N	\N	\N	\N
778	2	85	Last year, I spent $72 to buy a lot of ping-pong balls to use in geometry class. This year, the price of a ping-pong ball is 6 cents higher, and $72 buys 60 fewer balls. Figure\r\nout how many ping-pong balls I bought last year.		2014-08-30 14:29:29.816008	2014-08-30 14:29:29.816008	let n = number of balls bought last year, p = price per ball\r\np = 72/n\r\n(72/n+.06)*(n-60) = 72\r\n(72n - 4320)/(n - .06) + .06n - 3.6 = 72\r\n72n - 4320 + .06n² + .216 = 72n - 4.32\r\n.06n² - 4320 = 0\r\n6n² - 4320 = 0\r\n\r\nn = 300, .24 per ball\r\n	\N	\N	\N	\N	\N	\N
779	3	85	Because √8 can be rewritten as 2√2, the expression √8+5√2 can be combined into a single term 7√2. Combine each of the following into one term, without using a calculator:\r\n(a) √12 + √27 \r\n(b) √63 − √28 \r\n(c) √6 + √54 + √150 \r\n(d) 2√20 − 3√45		2014-08-30 14:37:40.216287	2014-08-30 14:37:40.216287	(a) √12 + √27          ->  2√3  + 3√3 = 5√3\r\n(b) √63 − √28          ->  3√7 -  2√7 = √7 \r\n(c) √6 + √54 + √150    ->   √6 +  3√6 + 5√6 = 9√6 \r\n(d) 2√20 − 3√45        ->  4√5 -  9√5 = -5√5	\N	\N	\N	\N	\N	\N
780	4	85	In performing a controlled experiment with fruit flies, Wes finds that the population of male fruit flies is modeled by the equation m = 2.2t²−1.6t+8, while the female population is modeled by the equation f = 1.6t² + 2.8t + 9, where t is the number of days since the beginning of the first day (thus t = 2 is the end of the second day). Assume that all flies live for the duration of the experiment.\r\n(a) At the beginning of the first day, there are how many more female flies than male flies?\r\n(b) Do male flies ever outnumber female flies? If so, when does that occur?\r\n(c) Find an equation that models the total number n of flies that exist at time t. How many are present at the end of the tenth day? At what time are there 1000 fruit flies in the population?		2014-08-30 16:34:00.533674	2014-08-30 16:36:41.802574	a) since t = 0 at the beginning of the first day, there are 8 males and 9 females, so 1 more.\r\nb) 2.2t²−1.6t+8 = 1.6t² + 2.8t + 9\r\n    .6t²-4.4t-1 = 0\r\n     6t²-44t-10 = 0\r\n     after around 7.5 days there are more males than females\r\nc) n = 2.2t²−1.6t+8 + 1.6t² + 2.8t + 9\r\n   n = 3.8t²+1.2t+17\r\n   n = 380 + 12 + 17\r\n   n = 409 after 10 days\r\n1000 = 3.8t²+1.2t+17\r\n   0 = 3.8t²+1.2t-983\r\n   t = 15.93, after 16 days\r\n \r\n	\N	PBL_ans_85_4.PNG	\N	\N	\N	\N
781	5	85	Solve each of the following for x. Leave your answers in exact form.\r\n(a) x√2 = √18 (b) x√6 = −√30 (c) √2x = 5 (d) 2√5x = √30		2014-08-30 16:45:54.10855	2014-08-30 16:45:54.10855	(a) x√2 = √18     ->  x√2 = 3√2  ->  x = 3\r\n(b) x√6 = −√30    ->  x√2√3 = -√10√3  -> x =  -√5 \r\n(c) √2x = 5       ->  x = 5/√2\r\n(d) 2√5x = √30    ->  x = √10√3/2√5  -> √6/2	\N	\N	\N	\N	\N	\N
782	6	85	Show by finding examples that it is hardly ever true that √(a + b) is the same as √a + √b .		2014-08-30 16:50:19.754791	2014-08-30 16:50:19.754791	√(4+9) != 5\r\n√(1+1) != 2\r\n√(1+0) - 1\r\n	\N	\N	\N	\N	\N	\N
783	7	85	Expand each of the following expressions and collect like terms:\r\n(a) (x + 2)³ (b) (x + 3)(x² − 3x + 9) (c) 1 − (x + 1)² (d) (2x + 1)² − 2(x + 1)²		2014-08-30 17:00:48.916481	2014-08-30 17:00:48.916481	(a) (x + 2)³    ->  (x+2)(x+2)(x+2)  ->  (x² + 4x +4)(x+2)  -> x³ + 4x² + 4x + 2x² + 8x + 8  ->  x³ + 6x² + 12x + 8\r\n(b) (x + 3)(x² − 3x + 9)   ->  x³ - 3x² + 9x + 3x² -9x + 27  ->   x³ + 27\r\n(c) 1 − (x + 1)²     ->  1 - x² - 2x -1  =  -x² - 2x\r\n(d) (2x + 1)² − 2(x + 1)²   ->  4x² + 4x + 1 - 2x² - 4x - 2  ->  2x² - 1	\N	\N	\N	\N	\N	\N
784	8	85	Given that √72 + √50 − √18 = √h, find h without using a calculator		2014-08-30 17:06:56.448569	2014-08-30 17:06:56.448569	√72 + √50 − √18 = √h\r\n√(9*2*2*2) + √(25*2) - √(9*2) = √h\r\n6√2 + 5√2 - 3√2 = 8√2 	\N	\N	\N	\N	\N	\N
785	9	85	My car averages 35 miles to a gallon of gas. When the price of gasoline was $3.09 per gallon, what was the cost per mile for gasoline for this car? What was the average distance I could travel per dollar?		2014-08-30 17:10:23.849458	2014-08-30 17:10:23.849458	3.09/35 = ~0.088 cents per mile\r\n~11.33 miles\r\n	\N	\N	\N	\N	\N	\N
786	10	85	What is the exact value of the expression x² − 5 when x = 2 + √5 ?		2014-08-30 17:12:47.451254	2014-08-30 17:12:47.451254	(2 + √5)² - 5\r\n4 + 4√5 + 5 - 5\r\n4 + 4√5	\N	\N	\N	\N	\N	\N
787	11	85	From its initial position at (1, 6), an object moves linearly with constant speed. It reaches (7, 10) after two seconds and (13, 14) after four seconds.\r\n(a) Predict the position of the object after six seconds; after nine seconds; after t seconds.\r\n(b) Will there be a time when the object is the same distance from the x-axis as it is from the y-axis? If so, when, and where is the object?		2014-08-30 17:19:16.091087	2014-08-30 17:19:16.091087	slope = 2/3\r\na) after 6 seconds (19,18), after 9 seconds (28,24), after t seconds (1+3t,6+2t)\r\nb) 1+3t = 6 + 2t\r\n      t = 5\r\n   1+15 = 6+10\r\nAfter 5 seconds the object is at (16,16)	\N	\N	\N	\N	\N	\N
819	3	89	Write an expression for the distance\r\n(a) from P = (3, 1) to Q = (x, 1); (b) from P = (3, 1) to Q = (x, y).		2014-08-31 17:09:49.461216	2014-08-31 17:09:49.461216	a) |3-x|\r\nb) √((3-x)²+(1-y)²)	\N	\N	\N	\N	\N	\N
788	1	86	By averaging 60 miles an hour, Allie made a 240-mile trip in just 4 hours. If Allie’s average speed had been only 40 miles per hour, how many hours would the same trip have taken? Record your answer in the given table, then complete the table, knowing that the whole trip was 240 miles.\r\n(a) Multiply 10 by 24, 20 by 12, etc. What do you notice?\r\n(b) Sketch the graph of y = 240/x , where x is speed and y is time.\r\n(c) What are meaningful values for the speed? Is there a largest one? Is there a smallest?\r\n(d) Is y a linear function of x? Is y a quadratic function of x? Explain.		2014-08-30 17:26:48.300313	2014-08-30 20:16:24.876723	rate    time\r\n10      24\r\n20      12\r\n30       8\r\n40       6\r\n50       4.8\r\n60       4\r\na) Rate times time always is 240\r\nb) attached\r\nc) Both numbers have to be positive, but there isn't a largest or smallest\r\nd) It is not a linear function, it curves. It isn't a quadratic as it doesn't involve x² directly, although is does have a somewhat similar curve	PBL_graph_86_1.PNG	PBL_ans_86_1.PNG	\N	\N	\N	\N
789	2	86	Eureka! A museum acquires an ancient crown that was supposed to be pure gold. Because of suspicions that the crown also contains silver, the crown is measured. Its weight is 42 ounces and its volume is 4 cubic inches. Given that gold weighs 11 ounces per cubic inch and silver weighs 6 ounces per cubic inch, and assuming that the crown really is an alloy of silver and gold, figure out how many ounces of silver are mixed with the gold.		2014-08-30 20:24:29.034043	2014-08-30 20:24:29.034043	g = 4 - s\r\n11g + 6s = 42\r\n44 - 11s + 6s = 42\r\n5s = 2\r\ns = 2/5, g = 18/5\r\n.4 ounces of silver are mixed in with the gold\r\ncheck:  (11*18)/5 + 12/5 = 198/5 + 12/5 = 210/5 = 42\r\n	\N	\N	\N	\N	\N	\N
790	3	86	A sign going down a hill on Route 89 says “8% grade. Trucks use lower gear.” The hill is a quarter of a mile long. How many vertical feet will a truck descend while going from the top of the hill to the bottom?		2014-08-30 20:26:06.760349	2014-08-30 20:26:06.760349	5280/4 = 1320 feet\r\n105.6 vertical feet\r\n	\N	\N	\N	\N	\N	\N
799	3	87	Factor each of the following as completely as you can:\r\n(a) p^4 − 4p² (b) w³ − 2w² − 15w (c) 16y − 9yz² (d) 2x² + 20x + 50		2014-08-30 22:27:57.39408	2014-08-30 22:27:57.39408	(a) p^4 − 4p²         ->  (p² - 2p)(p² + 2p)\r\n(b) w³ − 2w² − 15w    ->  w(w² - 2w - 15)  ->  w(w - 5)(w + 3)\r\n(c) 16y − 9yz²        ->  y(16-z²)  ->  y(4+z)(4-z)\r\n(d) 2x² + 20x + 50    ->  (x + 5)(2x + 10)	\N	\N	\N	\N	\N	\N
791	4	86	Find the x-intercepts in exact form of each of the following graphs:\r\n(a) y = (x − 6)² − 10 (b) y = 3(x − 7)² − 9 (c) y = 120 − 3x² (d) y = 4.2 − 0.7x²		2014-08-30 20:38:10.917611	2014-08-30 20:41:07.427597	(a) 0 = (x − 6)² − 10   -> (x − 6)² = 10  ->  x − 6 = ±√10  -> x = 6±√10\r\n(b) 0 = 3(x − 7)² − 9   -> (x − 7)² = 27  ->  x − 7 = ±√27  -> x = 7±√27\r\n(c) 0 = 120 − 3x²       -> 40 - x² = 0  ->  x = ±√40  -> x = ±2√10\r\n(d) 0 = 4.2 − 0.7x²     -> 42 - 7x² = 0  ->  x = ±√6  	\N	\N	\N	\N	\N	\N
792	5	86	In each of the following, collect like terms where possible:\r\n(a) 7√6 + 3√6 (b) 13√3 − 5√3 (c) √32 − √72 (d) √243 + √48 − √108		2014-08-30 20:47:42.977649	2014-08-30 20:47:42.977649	(a) 7√6 + 3√6         -> 10√6\r\n(b) 13√3 − 5√3        ->  8√3\r\n(c) √32 − √72         -> 4√2 - 6√2  ->  -2√2\r\nd) √243 + √48 − √108  -> 9√3 + 4√3 -  6√3  -> 7√3	\N	\N	\N	\N	\N	\N
793	6	86	6. Given that √k = √2 + √2 + √2 + √2 + √2, find the value of k without using a calculator.		2014-08-30 20:50:47.904587	2014-08-30 20:50:47.904587	(5√2)² = 25*2 = 50	\N	\N	\N	\N	\N	\N
794	7	86	Casey loves movies, but has just heard that the Regal Cinema is raising the price of a movie to $11.50. Casey decides to buy an iPad for $499 and download rental movies from Amazon for $1.99 each instead of going to the Regal Cinema.\r\n(a) In one month during the summer, Casey rents 30 movies. What is the average cost of these movies if the price of the iPad is included?\r\n(b) Write an equation that expresses A, the average cost of a rented movie, as a function of n, the number of movies rented.\r\n(c) For what values of n is A less than the price at the Regal Cinema?\r\n(d) Casey will of course continue to rent movies. Is there a limit to how low the average cost of a rental can go? If so, what is it? If not, explain why not.		2014-08-30 21:14:59.630789	2014-08-30 21:14:59.630789	a) ((30*1.99)+499)/30  = $18.62\r\nb) A = ((1.99n)+499)/n\r\nc) 11.99 > ((1.99n)+499)/n\r\n   11.99n = 1.99n+499\r\n   10n = 499\r\n     n = 49.9, values of n greater than 49\r\ncheck: 49*1.99\r\nd) The average price can never reach, much less go below 1.99.	\N	\N	\N	\N	\N	\N
795	8	86	Show that x = 3 + √2 is a solution to the equation x² − 6x + 7 = 0.		2014-08-30 21:19:05.295826	2014-08-30 21:19:05.295826	x² − 6x + 7 = 0\r\nx² − 6x + 9 = 2\r\n(x - 3)² = 2\r\nx - 3 = ±√2\r\nx = 3 ±√2	\N	\N	\N	\N	\N	\N
796	9	86	Expand and simplify:\r\n(a) (x − 1)(x + 1) (b) (x − 1)(x² + x + 1) (c) (x − 1)(x³ + x² + x + 1)		2014-08-30 21:22:12.966971	2014-08-30 21:22:12.966971	(a) (x − 1)(x + 1)            ->  x² - 1\r\n(b) (x − 1)(x² + x + 1)       ->  x³ + x² + x - x² - x - 1 ->  x³ - 1 \r\n(c) (x − 1)(x³ + x² + x + 1)  =?  x^4 - 1	\N	\N	\N	\N	\N	\N
797	1	87	Write x^5 − 1 as the product of two factors.		2014-08-30 21:23:34.469158	2014-08-30 21:23:34.469158	(x - 1)(x^4 + x³ + x²  x  1)	\N	\N	\N	\N	\N	\N
798	2	87	Find √(4+1/16) on your calculator. Is the result equivalent to √4 + √1/16? Explain.		2014-08-30 21:29:41.530468	2014-08-30 21:29:41.530468	√(4+1/16) = 2.0155644~\r\n√4 + √1/16 = 2.25\r\nThey are not the same, square roots don't distribute over addition. The square root of 1/16 is larger than 1/16, while if you add it to 4 it makes the total square root just a little bit greater.\r\n	\N	\N	\N	\N	\N	\N
800	4	87	The figure shows a bridge arching over the Laconic Parkway. To accommodate the road beneath, the arch is 100 feet wide at its base, 20 feet high in the center, and parabolic in shape.\r\n(a) The arch can be described by y = kx(x − 100), if the origin is placed at the left end of the arch. Find the value of the coefficient k that makes the equation fit the arch.\r\n(b) Is it possible to move a rectangular object that is 40 feet wide and 16.5 feet high (a wide trailer, for example) through the opening? Explain.		2014-08-30 23:00:12.597957	2014-08-30 23:00:12.597957	20 = 50k(50 − 100)\r\n20 = -2500k\r\nk = -0.008\r\ny = -0.008x(x-100)\r\ny = -0.008*30(30-100)\r\ny = 16.8\r\nYes, the object would just fit through.\r\n	PBL_graph_87_4.PNG	\N	\N	\N	\N	\N
801	5	87	There is a unique parabola whose symmetry axis is parallel to the y-axis, and that passes through the three points (1, 1), (−2,−2), and (0.−4). Write an equation for it. Given any three points, must there be a parabola that will pass through them? Explain.		2014-08-31 02:29:45.003453	2014-08-31 02:29:45.003453	y = ax² + bx - 4\r\n   1 = a + b - 4\r\n  -2 = 4a - 2b -4\r\n   2 = 2a + 2b -8\r\n+  0 = 6a - 12\r\n   a = 2\r\n   b = 3\r\ny = 2x² + 3x - 4\r\nNot any three points, since they might be in a line, but if they aren't in a line they have to make a triangle either up or down, and a parabola could be fit to that triangle.	\N	\N	\N	\N	\N	\N
802	6	87	The x- and y-coordinates of a point are given by the equations shown at right. The position of the point depends on the value assigned to t. Use your graph paper to plot points corresponding to the values t = −4, −3, −2, −1, 0, 1, 2, 3, and 4. Do you recognize any patterns? Describe what you see.		2014-08-31 02:42:27.804705	2014-08-31 02:42:27.804705	t  -4  -3  -2  -1   0   1   2   3   4\r\nx  -1   0   1   2   3   4   5   6   7\r\ny  13  11   9   7   5   3   1  -1  -3\r\n\r\nIt is describing a straight line.	PBL_graph_87_6.PNG	PBL_ans_87_6.PNG	\N	\N	\N	\N
821	5	89	Both legs of a right triangle are 8 cm long. In simplest radical form, how long is the hypotenuse? How long would the hypotenuse be if both legs were k cm long?		2014-08-31 17:14:38.603461	2014-08-31 17:14:38.603461	√128 -> 8√2\r\n√(2k²)	\N	\N	\N	\N	\N	\N
804	8	87	Find the solution to each equation:\r\n(a) x/3 + x/5 = 12 \r\n(b) (x − 2)/−2 = (4x − 3)/4\r\n(c) (x + 1)/3 + (x − 1)/x = 2		2014-08-31 03:01:56.146687	2014-08-31 03:01:56.146687	(a) x/3 + x/5 = 12            ->  5x/15 + 3x/15 = 12  ->  8x/15 = 12  ->  8x = 180  ->  x = 22.5\r\n(b) (x − 2)/−2 = (4x − 3)/4   ->  -2x + 4 = 4x - 3   ->  6x = 7  -> x = 7/6\r\n(c) (x + 1)/3 + (x − 1)/x = 2 ->  (x² + x)/3x + (3x - 3)/3x = 2   ->   x² + 4x - 3 = 6x  ->  x² - 2x - 3 -> (x - 3)(x + 1)  -> x = 3 or x = -1	\N	\N	\N	\N	\N	\N
805	9	87	Sam is a guest on the TV show Math Jeopardy, and has just chosen the $300 question in the category “Quadratic Equations.” The answer is “The solutions are x = 3 and x = −2.” What question could Sam ask that would win the $300? Is there more than one possible correct question?		2014-08-31 03:04:02.516554	2014-08-31 03:04:02.516554	'What is (x - 3)(x + 2) = 0?\r\nor\r\n'What is x² - x - 6 = 0\r\nThere are many many possible answers.	\N	\N	\N	\N	\N	\N
806	10	87	What is the distance from the point (4, 2) to the point (−3,−2)? Be prepared to explain your method.		2014-08-31 03:10:42.748891	2014-08-31 03:10:42.748891	The distance between the y points is 4\r\nThe distance between the x points is 7\r\nThese together make the two sides of a right triangle with the hypotenuse as the distance.\r\n16 + 49 = 65\r\nThe distance is √65	\N	\N	\N	\N	\N	\N
807	11	87	The diagram at right shows the flag of Sweden, which consists of a gold cross of uniform width against a solid blue background. The flag measures 3 feet 4 inches by 5 feet 4 inches, and the area of the gold cross is 30% of the area of the whole flag. Use this information to find the width of the gold cross.		2014-08-31 03:18:54.321389	2014-08-31 03:18:54.321389	40 inches wide, 64 inches long, area 2560 sq. in.\r\narea of cross is 768 sq. in.\r\n64w + 40w - w² = 768\r\nw² - 104w + 768 = 0\r\n(w - 8)(w - 96) = 0\r\n96 is too big, so the width of the cross is 8 inches.\r\n\r\n\r\n	PBL_graph_87_11.PNG	\N	\N	\N	\N	\N
808	1	88	Calculate the following distances, and briefly explain your method:\r\n(a) from (2, 1) to (10, 10) (b) from (−2, 3) to (7,−5)\r\n(c) from (0, 0) to (9, 8)   (d) from (4,−3) to (−4, 6)		2014-08-31 03:22:34.338876	2014-08-31 03:22:34.338876	(a) from (2, 1) to (10, 10)  ->  √(64+81) = √145\r\n(b) from (−2, 3) to (7,−5)   ->  √(81+64) = √145\r\n(c) from (0, 0) to (9, 8)    ->  √(81+64) = √145\r\n(d) from (4,−3) to (−4, 6)   ->  √(81+64) = √145	\N	\N	\N	\N	\N	\N
809	2	88	Halfway through the basketball season, Fran Tastik has attempted 40 free throws, and made 24 of them successfully.\r\n(a) What is Fran’s average, expressed as a percent?\r\n(b) Fran anticipates getting 30 more free throw tries by the end of the season. How many of these must Fran make, in order to have a season average that is at least 70%?		2014-08-31 03:25:38.970784	2014-08-31 03:25:38.970784	a) 60%\r\nb) 70*.7 = 49, he will have to make at least 25 of the last 30	\N	\N	\N	\N	\N	\N
810	3	88	The distance to the beach at Little Boar’s Head is 10 miles. If you were to walk at a steady 4 mph, how much time would be needed for the trip? If you were to ride your bike at 8 miles per hour, how much time would be needed for the trip? Express the relationship between the speed and the time in an equation. At what rate (miles per hour) must you travel if you want to make this trip in 1 hour? in one minute? in one second?		2014-08-31 15:28:37.817167	2014-08-31 15:28:37.817167	You would need 2.5 hours walking at a steady 4 mph.\r\nYou would need 1.25 hours biking at 8 mph.\r\nThe speed equals the distance divided by the time.\r\nIn 1 hour, 10 mph.\r\nIn i minute, 600 mph\r\nIn 1 second, 36000 mph	\N	\N	\N	\N	\N	\N
811	4	88	Pat and Kim are having another algebra argument. Pat is quite sure that √x² is equivalent to x, but Kim thinks otherwise. How would you resolve this disagreement?		2014-08-31 15:32:17.759463	2014-08-31 15:32:17.759463	Strictly speaking, not equivalent, since positive numbers have positive and negative roots, so the square root of -2 squared is -2 and 2.	\N	\N	\N	\N	\N	\N
812	5	88	To get from one corner of a rectangular court to the diagonally opposite corner by walking along two sides, a distance of 160 meters must be covered. By going diagonally across the court, 40 meters are saved. Find the dimensions of the court, to the nearest cm.		2014-08-31 15:47:45.218862	2014-08-31 15:47:45.218862	y = 160 - x\r\nx² + y² = 120²\r\nx² + (160 - x)² = 14400\r\nx² + x² -320x + 25600 = 14400\r\n2x² - 320x + 11200 - 0\r\nx² - 160x = -5600\r\nx² - 160x + 6400 = 6400-5600\r\n(x - 80)² = 800\r\nx - 80 = ±√800\r\nx = 80±√800\r\nx = 108.24 m or x = 51.72 m\r\nThe dimensions are 108.24, 51.72, and 120 meters.\r\n\r\n	\N	\N	\N	\N	\N	\N
813	6	88	A mathematics teacher wants to make up a quadratic equation ax2 + bx + c = 0, so that a, b, and c are integers, and the correct solutions are x = 1/2 and x = −3. Find values for a, b, and c that will do the job. Is there more than one equation that will work?		2014-08-31 15:51:47.573275	2014-08-31 15:51:47.573275	(x - .5)(x + 3) = 0\r\nx² + 2.5x - 1.5 = 0\r\nSo one possible solution is 1, 5/2 and -3/2\r\nIt could also be\r\n2x² + 5x - 3 = 0\r\nThere are many other possibilities	\N	\N	\N	\N	\N	\N
814	7	88	The distance from (0, 0) to (8, 6) is exactly 10.\r\n(a) Find coordinates for all the lattice points that are exactly 10 units from (0, 0).\r\n(b) Find coordinates for all the lattice points that are exactly 10 units from (−2, 3).		2014-08-31 16:08:11.511169	2014-08-31 16:08:11.511169	attached	\N	PBL_ans_88_7.PNG	\N	\N	\N	\N
815	8	88	Given four numbers a, b, c, and d, one can ask for the distance from (a, b) to (c, d). Write a procedure for computing this distance, using the four numbers.		2014-08-31 16:09:49.537594	2014-08-31 16:09:49.537594	√((a-c)²+(b-d)²)	\N	\N	\N	\N	\N	\N
816	9	88	The Prep class is going to produce a yearbook covering their first year, compiled from photos and stories submitted by Preps. The printing company charges $460 to set up and print the first 50 copies; additional copies are $5 per book. Only books that are paid for in advance will be printed (so there will be no unsold copies), and no profit is being made. (a) What is the cost to print 75 copies? What is the selling price of each book?\r\n(b) Write a function that describes the cost of printing n copies, assuming that n ≥ 50.\r\n(c) Express the selling price of each book as a function of n, assuming that n ≥ 50.\r\n(d) The Preps want to sell the book for $6.25. How many books must be sold to do this?\r\n(e) If only 125 copies are ordered, what price will be charged per book?\r\n(f) For what n is the selling price less than $5.05? How low can the selling price be?		2014-08-31 16:27:20.734399	2014-08-31 16:27:20.734399	a) $585 for 75 copies, or $7.80 per book\r\nb) 5(n - 50) + 460  ->  5n + 210\r\nc) (5n + 210)/n\r\nd) (5n + 210)/n = 6.25 \r\n   5n + 210 = 6.25n\r\n   1.25n = 210\r\n       n = 168 copies \r\ncheck: (168-50)*5 + 460 = 1050, 1050/168 = 6.25\r\ne) (5*125 + 210)/125 = $6.68\r\nf) (5n + 210)/n = 5.05\r\n    5n + 210 = 5.05n\r\n   .05n = 210\r\n      n = 4200 copies must be sold\r\nThe price can go as close to 0 as desired, but never actually 0.\r\ne)	\N	\N	\N	\N	\N	\N
817	1	89	The perimeter of a rectangular field is 80 meters and its area is 320 square meters.\r\nFind the dimensions of the field, correct to the nearest tenth of a meter.		2014-08-31 16:38:56.022759	2014-08-31 16:38:56.022759	2w + 2h = 80\r\nw*h = 320\r\nh = 320/w\r\n2w + 640/w = 80\r\n2w² + 640 = 80w\r\n2w² - 80w + 640 = 0\r\nw² - 40w = -320\r\nw² - 40w + 400 = 80\r\n(w - 20)² = 80\r\nw - 20 = ±√80\r\nw = 28.94 m, h = 11.06 m\r\ncheck: 28.94+11.06 = 40 * 2 = 80, 28.94*11.06 = 320.07\r\nw = 20±√80	\N	\N	\N	\N	\N	\N
818	2	89	If p is a positive number, sketch a rough graph of y = 2(x − 3p)(x + p). Label its vertex and its x- and y-intercepts with coordinates, stated in terms of p.		2014-08-31 17:06:57.68793	2014-08-31 17:06:57.68793	y = 2(x − 3p)(x + p)\r\ny = 2x² - 4px - 6p²\r\nx intercepts are 3p and -p\r\ny intercept is -6p² \r\nvertex is (p, -8p²)	\N	PBL_ans_89_2.PNG	\N	\N	\N	\N
823	7	89	Can you find integer lengths for the legs of a right triangle whose hypotenuse has length √5 ? What about √7 ? Explain your reasoning.		2014-08-31 17:20:17.60068	2014-08-31 17:20:17.60068	The sum of the squares of the other two side has to equal 5, or 7.\r\nIf one side is 1 and the other 2, the sum of the squares will be 5.\r\nYou can't do it with 7, since there aren't two perfect squares that add to 7. (1 + 6) or (2 + 5) or (3 + 4) are the only possibilities.	\N	\N	\N	\N	\N	\N
824	8	89	Find as many points as you can that are exactly 25 units from (0, 0). How many of them are lattice points?		2014-08-31 17:20:49.891919	2014-08-31 17:25:02.226543	(25,0),(-25,0),(0,25),(0,-25),(15,20),etc.\r\n(17.6776695,17.6776695), etc.\r\nThere are an infinite number, but the lattice points fall on the ±25,0 or ±15,±20 points.\r\n	\N	\N	\N	\N	\N	\N
825	9	89	On the number line shown below, a is a number between 0 and 1, and b is a number\r\nbetween 1 and 2. Mark possible positions on this line for √a, √b, a², b², and √(b/a)\r\n.		2014-08-31 20:22:23.826623	2014-08-31 20:22:23.826623	\r\n------|------*--|------*--|---------|---------|---------|---------\r\n      0      a  1      b  2         3         4         5\r\n√a            xx\r\n√b               xxxxxx\r\na²     xxxxxx\r\nb²                         xxxxxxxxxxxxxxxxxxx\r\n√(b/a)           xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx->\r\n        	PBL_graph_88_9.PNG	\N	\N	\N	\N	\N
826	10	89	What is the meaning of the number k when you graph the equation y = mx + k?\r\nWhat is the meaning of the number k when you graph the equation x = my + k?		2014-08-31 20:23:44.303995	2014-08-31 20:23:44.303995	k is the y intercept\r\nk is the x intercept	\N	\N	\N	\N	\N	\N
827	11	89	A triangle has K = (3, 1), L = (−5,−3), and M = (−8, 3) for its vertices. Verify that the lengths of the sides of triangle KLM fit the Pythagorean equation a² + b² = c².		2014-08-31 20:40:51.567492	2014-08-31 20:40:51.567492	√(4+121) = √(16+64) + √(9+36)\r\n125 = 80+45\r\n	\N	\N	\N	\N	\N	\N
828	12	89	A rectangle has an area of 36 square meters. Its length is 2√3 meters. In exact form, what is the perimeter of the rectangle?		2014-08-31 21:10:57.42887	2014-08-31 21:10:57.42887	36/2√3\r\n18/√3\r\n18√3/(√3*√3)\r\n6√3\r\ncheck: 12*√3*√3 = 36\r\n	\N	\N	\N	\N	\N	\N
829	13	89	How far is the point (5, 5) from the origin? Find two other first-quadrant lattice points that are exactly the same distance from the origin as (5, 5) is.		2014-08-31 21:16:37.809926	2014-08-31 21:16:37.809926	√50 or 2√5\r\nMake 50 from two perfect squares: 1² and 7² -> 1 + 49, so (1,49) and (49,1)	\N	\N	\N	\N	\N	\N
830	14	89	Find a quadratic equation that has solutions x = 0.75 and x = −0.5, and express your answer in the form ax2 + bx + c = 0, with a, b, and c being relatively prime integers.		2014-08-31 21:28:22.514308	2014-08-31 21:28:22.514308	(x - .75)(x + .5) = 0\r\nx² -.25x - .375 = 0\r\n4x² - x - 1.5 = 0\r\n8x² -2x - 3 = 0\r\n	\N	\N	\N	\N	\N	\N
831	15	89	Without using a calculator, find the value of x³−2x²y+xy² when x = 21 and y = 19.		2014-08-31 21:33:59.36335	2014-08-31 21:33:59.36335	x³−2x²y+xy²\r\nx(x²-2xy+y²)\r\nx(x-y)²\r\n21*4\r\n84	\N	\N	\N	\N	\N	\N
832	1	90	At noon one day, AJ decided to follow a straight course in a motor boat. After one hour of making no turns and traveling at a steady rate, the boat was 5 miles east and 12 miles north of its point of departure. What was AJ’s position at two o’clock? How far had AJ traveled? What was AJ’s speed?		2014-08-31 21:35:55.865821	2014-08-31 21:35:55.865821	10 miles east and 24 miles north.\r\nHe had traveled 26 miles, his speed was 13 mph.	\N	\N	\N	\N	\N	\N
833	2	90	(Continuation) Assume that the gas tank initially held 12 gallons of fuel, and that the boat gets 4 miles to the gallon. How far did AJ get before running out of fuel? When did this happen? How did AJ describe the boat’s position to the Coast Guard when radioing for help?		2014-08-31 21:39:30.63319	2014-08-31 21:39:30.63319	Total distance is 48 miles.\r\n48/13 = 3.69 hours, or about 3 hours and 42 minutes\r\n18.45 miles east and 44.28 miles north	\N	\N	\N	\N	\N	\N
834	3	90	Sketch the graphs of y = √x and y = √(x − 3) on the same system of axes. Describe in words how the two graphs are related. Do they intersect?		2014-08-31 22:06:55.770436	2014-08-31 22:06:55.770436	They get very close together, but they don't intersect.	\N	PBL_ans_90_3.PNG	\N	\N	\N	\N
835	4	90	Sketch the graphs of y = √x and y = √x − 3 on the same system of axes. Describe in words how the two graphs are related. Do they intersect?		2014-08-31 22:09:49.667354	2014-08-31 22:09:49.667354	The second graph is shifted 3 units down from the first. They don't intersect.	\N	PBL_ans_90_4.PNG	\N	\N	\N	\N
836	5	90	Find a quadratic equation of the form ax2+bx+c = 0 whose solutions are x = 4±√11.		2014-08-31 22:12:22.558542	2014-08-31 22:12:22.558542	(x - 4)² = 11\r\nx² - 8x + 16 = 11\r\nx² - 8x + 5 = 0	\N	\N	\N	\N	\N	\N
837	6	90	What is the y-intercept of the line ax + by = c? What is the x-intercept?		2014-08-31 22:17:22.724536	2014-08-31 22:17:22.724536	y intercept is c/b\r\nx intercept is c/a\r\n	\N	\N	\N	\N	\N	\N
838	7	90	Wes and Kelly decide to test their new walkie-talkies, which have a range of six miles. Leaving from the spot where Kelly is standing, Wes rides three miles east, then four miles north. Can Wes and Kelly communicate with each other? What if Wes rides another mile north? How far can Wes ride on this northerly course before communication breaks down?		2014-08-31 22:23:24.322563	2014-08-31 22:23:24.322563	3 east and 4 north they can communicate as they are 5 miles apart (3,4,5 triangle)\r\n3 east and 5 north they are about 5.83 miles apart (√34)\r\nAbout 5.2 miles (√27)\r\n\r\n\r\n\r\n	\N	\N	\N	\N	\N	\N
840	9	90	(Continuation) Find the x-intercepts of y = a(x − h)² + k in terms of a, h, and k.		2014-09-01 01:42:42.343365	2014-09-01 01:42:42.343365	0 = a(x − h)² + k\r\n0 = (x − h)² + k/a\r\n(x − h)² = k/a\r\nx - h = ±√(k/a)\r\nx = h±√(k/a)	\N	\N	\N	\N	\N	\N
841	10	90	(Continuation) Using the fact that x = h is the axis of symmetry and k is the y-coordinate of the vertex, make substitutions in your x-intercept formulas to express the x-intercepts in terms of a, b, and c, rather than h and k. Does your answer remind you of another important formula in algebra?	Needs checking	2014-09-01 01:43:45.278196	2014-09-01 01:50:23.680683	x = (-b/2a)±√(-b²-4ac)\r\nit is the quadratic formula	\N	\N	\N	\N	\N	\N
839	8	90	We know that the axis of symmetry for a parabola in the form y = ax² + bx + c can be found from the formula x = − b/2a. The equation of the axis of symmetry can help us find the y-coordinate of the vertex. Make the appropriate substitution, using x = − b/2a, and find a formula for the y-coordinate of the vertex in terms of a, b, and c.		2014-09-01 01:38:24.984875	2014-09-01 01:49:34.216547	y = a(-b/2a)² + bx + c\r\ny = b²/4a - 2b²/4a + c\r\ny = -b²/4a + c\r\ny = b² - 4ac	\N	\N	\N	\N	\N	\N
842	11	90	A bell rope, passing through the ceiling above, just barely reaches the belfry floor. When one pulls the rope to the wall, keeping the rope taut, it reaches a point that is three inches above the floor. It is four feet from the wall to the rope when the rope is hanging freely. How high is the ceiling? It is advisable to make a clear diagram for this problem.		2014-09-01 02:04:59.702332	2014-09-01 02:04:59.702332	h² = (h-.25)² + 16\r\nh² =  h² -.5h + .0625 + 16\r\n.5h = 16.0625\r\nh = 32.125 feet\r\ncheck: 4²+31.875² = 32.125	\N	PBL_ans_90_11.PNG	\N	\N	\N	\N
843	1	91	Find both solutions to 3x² − 7x + 3 = 0.\r\n(a) Verify that your two answers are reciprocals of one another.\r\n(b) Find another quadratic equation with the same reciprocal property.		2014-09-01 02:20:26.466422	2014-09-01 02:43:04.976274	3x² − 7x + 3 = 0\r\na) x² - 7x/3 = -1\r\n   x² - 7x/3 + 49/36 = 13/36\r\n  (x - 7/6)² = 13/36\r\n  x - 7/6 = ²√13/6\r\n  x = 7/6 ²√13/6\r\n  x = (7²√13)/6\r\n (7+√13)/6 * (7-√13)/6\r\n (49 - 13)/36 = 36/36 = 1\r\nb) 6x² - 14x + 6 = 0\r\n   (x-3)(x-1/3)  ->  x² - 10x/3 + 1 or 3x² - 10x + 3\r\n	\N	\N	\N	\N	\N	\N
844	2	91	Draw a right triangle whose legs are 2 cm and 1 cm long, as shown at right. Find the length of its hypotenuse. \r\n(a) Use this hypotenuse as one of the legs of a second right triangle, and construct the other leg so that it is 2 cm long and adjacent to the previous 2-cm leg, as shown. Find the length of the hypotenuse of this right triangle.\r\n(b) Use this hypotenuse as one of the legs of a third right triangle, and construct the other leg so that it is 2 cm long and adjacent to the previous 2-cm leg. Find the hypotenuse of this right triangle.\r\n(c) This process can be continued. What are the lengths of the legs of the next triangle that has a rational hypotenuse? Are there more triangles like this?		2014-09-01 02:59:08.612067	2014-09-01 05:38:53.852347	The length of the hypotenuse is √5\r\na) The length of the new hypotenuse is √(4+5) or 3\r\nb) √13\r\nc) √21 and 2, hypotenuse 5, yes it continues, the next rational hypotenuse will be 7\r\n	PBL_graph_91_2.PNG	PBL_ans_91_2.PNG	\N	\N	\N	\N
845	3	91	After running the 100-yard dash for the first time in Prep track, Taylor set a PEA career goal: to run this race 2 seconds faster. Taylor calculated that this means a rate increase of 5 feet per second. Figure out what Taylor’s time was in that first race.		2014-09-01 05:38:36.649886	2014-09-01 05:44:10.594345	let t equal his time in the first race.\r\n\r\nt = 12 seconds for his original time\r\n\r\nrate is 25 feet per second, which he needs to increase to 30\r\n300/25 = 12, 300/30 = 10, an improvement of 2 seconds.\r\n	\N	\N	\N	\N	\N	\N
846	4	91	Alex is making a 4-mile trip. The first two miles were at 30 mph. At what speed must Alex cover the remaining two miles so that the average speed for the entire trip will be \r\n(a) 50 mph? (b) 55 mph? (c) 59.9? (d) 60 mph?		2014-09-01 06:02:52.92294	2014-09-01 06:02:52.92294	First half time is 2/30 of an hour or 4 minutes.\r\na) 50 mph total time- 4.8 minutes, so the second 2 miles has to be done in .8 minutes, 120/.8, or 150 mph\r\nb) 55 mph total time- 4.36 minutes, second 2 miles, 120/.36 or about 333 mph.\r\nc) 59.9 mph total time 4.06, second 2 miles, 120/.06 or 2,000 mph\r\nd) he would have to go infinitely fast	\N	\N	\N	\N	\N	\N
849	7	91	Give an example of a line that is parallel to 2x+5y = 17. Describe your line by means of an equation. Which form for your equation is most convenient? Now find an equation for a line that is equidistant from your line and the line 2x + 5y = 41.		2014-09-01 14:04:53.331671	2014-09-01 14:28:55.086345	2x+5y = 17\r\n5y = -2x + 17\r\ny = -2x/5 + 17/5\r\ny = -2x/5 + 22/5\r\npoint-slope form is the most convenient\r\n2x + 5y = 41, 41-17 = 24, add 12 to 17\r\n2x + 5y = 29\r\n	\N	\N	\N	\N	\N	\N
847	5	91	The diagram at right shows the flag of Denmark, which consists of a white cross of uniform width against a solid red background. The flag measures 2 feet 11 inches by 3 feet 9 inches, and the area of the white cross is 5=21 of the area of the whole flag. Use this information to find the width of the white cross.		2014-09-01 06:04:16.941752	2014-09-01 06:11:31.218756	35 inches high by 45 inches wide, area is 1575 sq. inches. Area of cross, 375 inches.\r\nw*45 + w*35 - w² = 375\r\nw² - 80w + 375 = 0\r\n(w-75)(w-5) = 0\r\nwidth = 5\r\ncheck: 5*45 + 5*35 - 25 = 375\r\n	PBL_graph_91_5.PNG	\N	\N	\N	\N	\N
848	6	91	Graph the nonlinear equation y = 9−x², identifying all the axis intercepts. On the same system of coordinate axes, graph the line y = 3x−5, and identify its axis intercepts. You should see two points where the line intersects the parabola. First estimate their coordinates, then calculate the coordinates exactly by solving the system of simultaneous quations. Which methods of solution work best in this example?		2014-09-01 06:14:59.86524	2014-09-01 14:22:46.618289	Parabola y intercept at 9, x intercepts at -3 and 3.\r\nLine y intercept at -5, x intercept at 5/3\r\nEstimated coordinates of intersections: (2.25,2.5) and (-5.5,-21.5)\r\ny = 9 - x²\r\ny = -5 + 3x\r\n9 - x² = -5 + 3x\r\nx² + 3x - 14 = 0\r\nx² + 3x = 14\r\nx² + 3x + 9/4 = 56/4 + 9/4\r\n(x + 3/2)² = ±√65/2\r\nx = (-3±√65)/2, -5.53, 2.53\r\ny = -5 + 3*-5.53 - 5 = -21.53\r\ny = -5 + 3*2.53 = 2.59\r\n(-5.5,-21.53), (2.53,2.59)\r\nThe easiest method is to set the two equations equal to each other.\r\n	\N	\N	\N	\N	\N	\N
850	1	92	A PEA crew training on the Squamscott River, which has a current of 3 kph, wondered what their speed r would be in still water. A mathematician in the boat suggested that they row two timed kilometers — one going upstream and one going downstream. Write an expression that represents their total time rowing these two kilometers, in terms of r.		2014-09-01 14:32:50.180036	2014-09-01 14:32:50.180036	d = rt\r\n1 = (r-3)t\r\n1 = (r+3)t\r\nt = 1/r-3 + 1/r+3 \r\n	\N	\N	\N	\N	\N	\N
852	3	92	Most positive integers can be expressed as a sum of two or more consecutive positive integers. For example, 24 = 7+8+9, 36 = 1+2+3+4+5+6+7+8, and 51 = 25+26. A positive integer that cannot be expressed as a sum of two or more consecutive positive integers is therefore interesting. The simplest example of an interesting number is 1.\r\n(a) Show that no other odd number is interesting.\r\n(b) Show that 14 is not an interesting number.\r\n(c) Show that 82 is not an interesting number.\r\n(d) Find three ways to show that 190 is not an interesting number.\r\n(e) Find three ways to show that 2004 is not an interesting number.\r\n(f) How many interesting numbers precede 2004?		2014-09-01 16:46:26.315148	2014-09-01 16:46:26.315148	a) any odd number can be divided in half with one left over, which makes the two numbers\r\nb) 2+3+4+5\r\nc) 19+20+21+22\r\nd) 46+47+48+49, 36+37+38+39+40,1-19\r\ne) 72-85,667-669,\r\nf) 1003?	\N	\N	\N	\N	\N	\N
851	2	92	Hill and Dale were out in their rowboat one day, and Hill spied a water lily . Knowing that Dale liked a mathematical challenge, Hill demonstrated how it was possible to use the plant (which was rooted to the bottom of the pond) to calculate the depth of the water under the boat. Without uprooting it, Hill gently pulled the plant sideways, causing it to disappear at a point that was 35 inches from its original position. The top of the plant originally stood 5 inches above the water surface. Use this information to calculate the depth of the water.		2014-09-01 14:45:48.513781	2014-09-01 16:59:30.366152	h² = 35² + (h-5)²\r\nh² = 1225 + h² - 10h + 25\r\n10h = 1250\r\nh = 125 inches\r\ncheck: 35² + 120² = 125²\r\n1225 + 14400 = 15625	\N	PBL_ans_92_2.PNG	\N	\N	\N	\N
853	4	92	On a single set of coordinate axes, graph several parabolas of the form y = bx − x². Mark the vertex on each curve. What do you notice about the configuration of all such vertices?		2014-09-01 16:58:56.141387	2014-09-01 17:00:08.105297	The axis of symmetry is half of b.\r\nThe y value of the vertex is thus b²/2 - b²/4	\N	PBL_ans_92_4.PNG	\N	\N	\N	\N
854	5	92	Sketch the graphs of y = 2√x and y = x − 3, and then find all points of intersection.\r\nNow solve the equation 2√x = x−3 by first squaring both sides of the equation. Do your answers agree with those obtained from the graph?		2014-09-01 17:06:06.235219	2014-09-01 17:06:06.235219	2√x = x−3\r\n4x = x²-6x + 9\r\nx²-10x + 9 = 0\r\n(x+1)(x-9) = 0\r\n(9,6) is the only point of intersection, as -1 doesn't have a rational square root.	\N	PBL_ans_92_5.PNG	\N	\N	\N	\N
856	7	92	From its initial position at (−1; 12), a bug crawls linearly with constant speed and direction. It passes (2; 8) after two seconds. How much time does the bug spend in the first quadrant?		2014-09-01 17:10:48.258185	2014-09-01 17:10:48.258185	The bug takes two seconds to go down 4 units. \r\nThe y intercept is 10.67, so 10.67/4 * 2 = 5.335 seconds.	\N	\N	\N	\N	\N	\N
855	6	92	Show that the solutions to ax2 + bx + a = 0 are reciprocals.		2014-09-01 17:06:22.340818	2014-09-01 17:40:39.402246	(-b±√(b²-4ac))/2a\r\n(-b+√(b²-4a²))/2a *(-b-√(b²-4a²))/2a\r\n(b²-b²+4a²)/4a² = 1	\N	\N	\N	\N	\N	\N
211	1	24	Day student Morgan left home at 7:00 one morning, determined to make the ten-mile trip to PEA on bicycle for a change. Soon thereafter, a parent noticed forgotten math homework on the kitchen table, got into the family car, and tried to catch up with the forgetful child. Morgan had a fifteen-minute head start, and was pedaling at 12 mph, while the parent pursued at 30 mph. Was Morgan reunited with the homework before reaching PEA that day? If so, where? If not, at what time during first period (math, which starts at 8:00) was the homework delivered?		2014-07-19 20:32:10.359087	2014-10-27 15:20:14.541741	yes, at 7:25, 5 mi down road |\r\nMorgan = 7 + 10/12 = 7.833 arr school ~7:50\r\nParent = 7.25 + 10/30 = 7.58 arr school ~7:35\r\nMorgan got the books before getting to school\r\n7 + d/12 = 7.25 + d/30\r\nd/12 - d/30 = .25\r\n5d/60 - 2d/60 = .25\r\n3d/60 = .25\r\nd/20 = .25\r\nd = 5\r\ntime = 7 + 41.66 or 7.25 + .166\r\n       7.4166\r\nThey met at 7:25, 5 miles down the road.\r\n	\N	\N	yes, at 7:25, 5 mi down road	Maya	Christian	1
207	9	23	So that it will be handy for paying tolls and parking meters, Lee puts pocket change (dimes and quarters only) into a cup attached to the dashboard. There are currently 102 coins in the cup, and their monetary value is $17.10. How many of the coins are dimes?		2014-07-19 19:57:34.673028	2014-10-27 15:18:24.301138	56 dimes |\r\n10d + 25(102-d) = 1710\r\n10d + 2550 - 25d   = 1710\r\n15d = 840\r\nd = 56, q = 46\r\n\r\ncheck: 46 *.25 = 11.50 + 5.60 = 17.10	\N	\N		Lucia	Nicole	1
225	4	25	According to the US Census Department, someone born in 1950 has a life expectancy of 68.2 years, while someone born in 1970 has a life expectancy of 70.8 years.\r\n(a) What is a reasonable life expectancy of someone born in 1960?\r\n(b) What is a reasonable life expectancy of someone born in 1980?\r\n(c) What is a reasonable life expectancy of someone born in 2000?\r\nPart (a) is an interpolation question. Parts (b) and (c) are extrapolation questions. Which of your answers are you the most confident about? Explain.	\r\n	2014-07-21 15:26:36.719085	2014-10-27 16:31:56.539762	a) 69.5  b) 72.1  c) 74.7 |\r\na) (70.8 + 68.2)/2 = 69.5\r\nb) 70.8 + 1.3 = 72.1\r\nc) 72.1 + 2.6 = 74.7\r\nWe can be more confident in the interpolation (a) as it is very unlikely that the value wasn't somewhere between the value 10 years earlier and the value 10 years later. The extrapolated values assume that the improvement is constant when in fact it could be accelerating or slowing down. 	\N	\N	a) 69.5  b) 72.1  c) 74.7	Lucia	Hannah	1
193	6	22	Day student Chris does a lot of babysitting. When parents drop off their children and Chris can supervise at home, the hourly rate is $3. If Chris has to travel to the child’s home, there is a fixed charge of $5 for transportation in addition to the $3 hourly rate. \r\n(a) Graph y = 3x and y = 3x + 5. What do these lines have to do with the babysitting context? What feature do they have in common? How do they differ?\r\n(b) What does the graph of y = 3x+6 look like? What change in the babysitting context does this line suggest?		2014-07-19 14:23:31.029234	2014-10-10 15:21:24.918796	a) graph attached, these lines show income per hour for the two situations. They have the same slope, i.e. increase at the same rate, but intercept the x axis in different places, one is always 5 units higher than the other, lines are parallel\r\nb) y = 3x + 6 would be parallel to and lie one unit above the y = 3x + 5 graph. It would suggest the travel rate was $6 instead of $5.	\N	PBL_ans_22_6.PNG	--	Matt V	Simon, Hannah	1
254	4	28	Write an equation for the line that goes through the point (1,5) and that has slope 2/3.	\r\n\r\nPoint slope form review	2014-07-27 04:17:14.125272	2014-10-27 17:00:03.288556	y = 2/3(x - 1) + 5 |\r\n(y - 5) = 2/3(x - 1)	\N	\N	y = 2/3(x - 1) + 5	Suzana	Nicole	1
228	7	25	For each of the following situations, draw a plausible graph that shows the relationship\r\nbetween the time elapsed (horizontal axis) and the indicated speed (vertical axis). In other\r\nwords, graph speed versus time for each of the following:\r\n(a) A car in a bumper test travels at a steady speed until it crashes into a wall.\r\n(b) Your workout consists of some jogging, some hard running, some more jogging, some more hard running, and finally some walking.\r\n(c) A roller coaster slowly climbs up a steep ramp and then zooms down the other side.\r\n(Plot the car’s speed just to the bottom of the first hill.)\r\n(d) A car speeds at a steady rate along a highway until an officer pulls it over and gives\r\nthe driver a ticket. The car then resumes its journey at a more responsible speed.	\r\n	2014-07-21 15:52:20.995214	2014-10-27 16:33:42.568422	Graph attached |	\N	PBL_ans_25_7.PNG	Graph attached 	Alex	Jared	1
188	1	22	Each of the data sets at right represents points on a line. \r\nIn which table is one variable directly related to the other?\r\nWhy does the other table not represent a direct variation?\r\nFill in the missing entry in each table.	\r\nIntroducing x intercept concept.	2014-07-17 16:40:49.722085	2014-10-10 15:16:50.511732	The second table is clearly a direct variation.\r\nThe first one doesn't start from the origin, so you have to add 4 to get the y value. Other than that it is the same variation as the second table.\r\nNot starting from the origin means it is not a direct variation, since y != kx\r\nFirst table: 28\r\nSecond table: 24 	PBL_Graph_22_1.PNG	\N	Doesn't go through origin	Jason	Hannah, Julia	1
227	6	25	When it is 150 miles west of its destination, a jet is flying at 36920 feet. When it is 90 miles west of its destination, the jet is at 21320 feet. Using this data, sketch a graph of the jet’s descent. Is a linear model reasonable to use in this situation? Explain.	\r\n	2014-07-21 15:43:32.091357	2014-10-27 16:33:05.00542	Not reasonable as stated |\r\nSlope is (36920-21320)/(-120- -90) -> 15600/-30, or -520 (feet per mile). Thus in the remaining 90 miles it would descend 46800 feet if the descent were linear, causing it to hit the ground well before the airport.\r\nIt is not totally unreasonable to use a linear model as the jet has to end at 0,0 and the two points make almost a straight line. However, strictly connecting the points to form a line shows the jet hitting the ground before the airport. In reality the jet probably descends faster at first and has to slow up its descent as it gets closer to the ground.	\N	PBL_ans_25_6n.PNG	Not reasonable as stated	Matt K	Sam	1
272	9	29	The solution of |x| = 6 consists of the points 6 and −6. Show how to use a test point on the number line to solve and graph the inequality |x| ≤ 6. Do the same for |x| ≥ 6.		2014-07-27 06:22:23.044189	2014-10-07 15:23:06.963352	a) |x| ≤ 6   test point 0 works as 0 is less than 6, same for test points -5 and 5\r\n ----|----*====|====|====|====|====|====|====|====|====|====|====|====*----|----\r\n    -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5    6    7\r\n\r\na) |x| ≥ 6    test point 0 doesn't work as 0 is less than 6, same for test points -5 and 5\r\n ====|====*----|----|----|----|----|----|----|----|----|----|----|----*====|====\r\n    -7   -6   -5   -4   -3   -2   -1    0    1    2    3    4    5    6    7       	\N	\N	--		Caroline	1
246	7	27	What is the distance between 6 and −6? between 24 and 17? between 17 and 24? between t and 4? The distance between two points is always positive. If a and b are two points on a number line, the distance is therefore either a − b or b − a, whichever is non-negative. This is an example of an 'absolute-value' calculation, and the result is written |a − b|. What is the meaning of |b − a|?	\r\n	2014-07-24 01:26:05.886745	2014-10-27 16:46:40.057601	12, 7, 7, t-4 or 4-t | \r\nDistance between 6 and -6 is 12.\r\nDistance between 24 and 17 is 7.\r\nDistance between t and 4 is the absolute value (i.e. the positive value) of t - 4.\r\nThe meaning of |b − a| is the distance from a to b, i.e. that after the subtraction is done if the value is negative it is converted to positive, i.e. multiplied by -1.	\N	\N	12, 7, 7, t-4 or 4-t	Matt V.	Julia, Caroline	1
288	3	31	Pat and Kim are operating a handcar on the railroad tracks. It is hard work, and it takes an hour to cover each mile. Their big adventure starts at 8 am at Rockingham Junction, north of Exeter. They reach the Main St crossing in Exeter at noon, and finish their ride in Kingston at 3 pm. Let t be the number of hours since the trip began, and d be the corresponding distance (in miles) between the handcar and Main St. With t on the horizontal axis, draw a graph of d versus t, after first making a table of (t, d) pairs for 0 ≤ t ≤ 7.		2014-07-28 00:36:22.321552	2014-10-09 16:04:08.186644	-\r\ntime     | 0 | 1 |  2 |  3 |  4 |  5 |  6 |  7 |\r\ndistance | 4 | 3 |  2 |  1 |  0 |  1 |  2 |  3 |	PBL_graph_31_3.PNG	pbl_ans_31_-2.PNG	--	Scott		\N
274	1	30	Twelve flags are evenly spaced around a running track. Ryan started running at the first flag and took 30 seconds to reach the sixth flag. How many seconds did it take Ryan, running at a constant rate, to reach (a) the 10th flag for the first time? \r\n(b) the 8th flag for the 2nd time? \r\n(c) the nth flag for the mth time?		2014-07-27 06:46:55.670246	2014-10-08 16:02:13.84109	6 seconds per flag, there are 12 equally spaced pieces between the 12 flags, so 1 lap takes 72 seconds.\r\na) 54 seconds - 9 segments (10-1) * 6 seconds per flag\r\nb) 114 seconds - 1 lap (72 seconds) + (8-1) flags * 6 or 42 seconds for the second lap\r\nc) (m-1)72 + ((n-1)*6))\r\n	\N	\N	54 sec, 114 sec., 6(12(m-1)+(n-1)) sec.	Lucia, Scott	Hannah, Nicole, Julia, Julia	1
269	6	29	As you know, temperatures can be measured by either Celsius or Fahrenheit units; 30◦C is equivalent to 86◦F, 5◦C is equivalent to 41◦F, and −10◦C is equivalent to 14◦F. \r\n(a) Plot this data with C on the horizontal axis and F on the vertical axis.\r\n(b) Verify that these three data points are collinear.\r\n(c) Find a linear equation that relates C and F.\r\n(d) Graph F versus C. In other words, graph the linear equation you just found.\r\n(e) Graph C versus F. You will need to re-plot the data, with C on the vertical axis.\r\n(f) On New Year’s Day, I heard a weather report that said the temperature was a balmy 24◦C. Could this have happened? What is the corresponding Fahrenheit temperature?\r\n(g) Water boils at 212◦F and freezes at 32◦F at sea level. Find the corresponding Celsius temperatures.\r\n(h) Is it ever the case that the temperature in degrees Fahrenheit is the same as the temperature in degrees Celsius?		2014-07-27 06:14:11.701624	2014-10-06 18:36:16.581893	c) F = (9C)/5 + 32 f) yes g) 100,0 h) -40 |\r\na,b) attached\r\nc) F = 45/25C + 32\r\nd) attached\r\ne) attached, F = 9/5C + 32 ->  F - 32 = 9/5C  ->  C = 5/9F - (32*5)/9 ->  C = 5/9F - 17.777->\r\nf) Yes, the corresponding would be about 75, which would be possible on New Year's Day\r\ng) 100 and 0\r\n(212*5)/8  - 17.7 = 100,  (32*5)/9 - 17.77 = 0\r\nh) Yes, the two are the same at -40, where the points intersect on the graph	\N	PBL_ans_29_6.PNG		Maya		\N
857	-1	73	This is a special question for storing search data, do not delete.	S1 - Miranda	2014-09-19 15:21:50.846974	2015-02-27 13:13:16.154452		\N	\N	\N	\N	\N	\N
291	6	31	(Continuation) Solve the equation |t − 3| = 1 and interpret the answers		2014-07-28 01:37:35.811235	2014-10-17 16:15:12.477094	t - 3 = 1 or t - 3 = -1\r\nt = 4 or t = 2\r\n\r\n2 and 4 are both 1 unit from 3.	\N	\N	t = 4 or t = 2	Lucia	Sam	1
255	5	28	The equation 5x−8y = 20 expresses a linear relationship between x and y. The point (15, 7) is either on the graph of this line, above it, or below it. Which? How do you know?	\r\n	2014-07-27 04:24:16.535036	2014-10-27 17:00:40.552968	above | \r\nSubstituting 15 for x and 7 for y, which makes 75 - 56, or 19, so the point is not on the line. The point would be above the line since solving with 15 for x gives 75 - 8y = 20 -> 8y = 55 -> y = 6.875, which is less than 7. 	\N	\N	above	Matt V.	Nicole	1
858	0	92			2014-10-10 13:52:51.810159	2014-10-10 13:52:51.810159		\N	\N			Simon, Liam	1
261	11	28	To graph linear equations such as 3x + 5y = 30, one can put the equation into slopeintercept form, but (unless the slope is needed) it is easier to find the x- and y-intercepts and use them to sketch the graph. Find the axis intercepts of each of the following and use them to draw the given line. An equation ax + by = c is said to be in standard form.\r\n(a) 20x + 50y = 1000 (b) 4x − 3y = 72		2014-07-27 05:02:33.296341	2014-10-27 17:03:06.465956	a) x int: 50, y int: 20 b)  x int: 18, y int: -24 |\r\na) 20x = 1000, x intercept = 50.  50y = 1000, y intercept = 20.\r\nb) 4x = 72, x intercept = 18.   3y = 72,   y intercept = -24.	\N	PBL_Graph_28_11.PNG	a) x int: 50, y int: 20 b)  x int: 18, y int: -24			1
308	12	32	Graph y = |x−5| and y = |x+3|, then describe in general terms how the graph of y = |x| is transformed to produce the graph of y = |x − h|.		2014-07-29 07:32:35.481988	2014-10-14 14:01:38.87787	The x intercept moves in the opposite direction the given number of units from the origin.	\N	PBL_ans_32_12.PNG	transformed horizontally h units	Zach		1
463	8	47	(Continuation) Explain how the two graphs show that there is a unique rectangle whose perimeter is 768 cm, and whose length is twice its width. Find the dimensions of this rectangle.		2014-08-08 23:50:39.47158	2014-12-11 16:07:45.787176	The two lines cross in positive territory, so there is one solution that satisfies both equations.\r\n2w = l\r\n2w = (768-2w)/2\r\n4w = 768 - 2w\r\n6w = 768\r\nw = 128\r\nl = 256\r\ncheck: 6*128 = 768\r\n	\N	\N	128 x 256 cm	Matt K.	Sam, Tori	\N
316	7	33	The manager at Jen and Berry’s Ice Cream Company estimates that the cost C (in dollars) of producing n quarts of ice cream in a given week is given by the equation C = 560 + 1.20n.\r\n(a) During one week, the total cost of making ice cream was $1070. How many quarts were made that week?\r\n(b) Explain the meanings of the “560” and the “1.20” in the cost equation.		2014-07-29 16:39:00.717598	2014-10-23 14:18:25.405068	a) 1070 = 560 + 1.20n  ->  1.2n = 510  ->  n = 425 quarts were made\r\nb) 560 is the fixed cost, presumably of the labor, etc. 1.20 is a cost that varies with the amount made, presumably of the needed materials.	\N	\N	a) 425,  b) 560 fixed cost, 1.20 varying cost	Jason	Liam	1
317	8	33	As anyone knows who has hiked up a mountain, the higher you go, the cooler the temperature gets. At noon on July 4th last summer, the temperature at the top of Mt. Washington—elevation 6288 feet—was 56◦F. The temperature at base camp in Pinkham Notch — elevation 2041 feet — was 87◦F. It was a clear, still day. At that moment, a group of hikers reached Tuckerman Junction — elevation 5376 feet. To the nearest degree, calculate the temperature the hikers were experiencing at that time and place. When you decided how to model this situation, what assumptions did you make?	Great problem.	2014-07-29 20:26:12.471885	2014-10-23 14:19:04.571579	Change in temperature-  87-56, or 31 degrees cooler\r\nChange in altitude-   6288-2041, or 4247 feet difference\r\n4247/31 means the temperature goes down about 1 degree for each additional 137 feet of elevation.  \r\nTuckerman Junction is 5376-2041 feet above Pinkham Notch, or 3335 feet of additional altitude. 3335/137 would subtract about 24.3 degrees from the base temp of 87, making it about 63 degrees at Tuckerman.\r\nThis assumes that the decrease in temperature is constant as altitude increases, which probably isn't the case, since the local recorded temperature can be affected by many factors including wind and amount of sunshine.	\N	\N	63◦ F	Suzana, Matt V.,Lucia, Maya	Julia, Nicole	1
253	3	28	The table at right shows data that Morgan collected during a 10-mile bike ride that took 50 minutes. The cumulative distance (measured in miles) is tabled at ten-minute intervals. \r\n(a) Make a scatter plot of this data. Why might you expect the data points to line up? Why do they not line up?\r\n(b) Morgan’s next bike ride lasted for 90 minutes. Estimate its length (in miles), and explain your method. What if the bike ride had lasted t minutes; what would its length be, in miles?		2014-07-27 04:15:00.496569	2014-10-27 16:50:08.070065	a) real data not strictly linear, b) 18 mi, 0.2t mi | \r\na) attached. Humans don't ride bikes at a constant speed even on the flats, and hills would further affect her speed.\r\nb) The estimate is 18 miles, based on her average speed of about 1 mile every 5 minutes, i.e. .2 miles per minute or about 12 mph. So the estimate would be t*.2.	PBL_Graph_28_3.PNG	PBL_ans_28_3.PNG	a) real data not strictly linear, b) 18 mi, 0.2t mi			1
332	12	34	A cube measures x cm on each edge.\r\n(a) Find a formula in terms of x for the volume of this cube in cubic centimeters (cc).\r\n(b) Evaluate this formula when x = 1.5 cm; when x = 10 cm.\r\n(c) Write an expression for the area of one of the faces of the cube. Write a formula for the total surface area of all six faces.\r\n(d) Evaluate this formula when x = 1.5 cm; when x = 10 cm.\r\n(e) Although area is measured in square units and volume in cubic units, is there any cube for which the number of square units in the area of its faces would equal the number of cubic units in the volume?		2014-07-29 22:42:42.561036	2014-10-27 16:16:59.707322	a) volume of the cube is x * x * x or x^3\r\nb) 1.5^3 = 1.5*1.5*1.5 = 3.375 cc,  10^3 = 10*10*10 or 1000 cc\r\nc) x^2 for one side, 6x^2 for the total surface area\r\nd) 1.5^2 * 6 = 13.5 sq. cm,  10*10*6 = 600 sq. cm\r\ne) x*x*x = 6*x*x, a 6x6x6 cube would have a volume and surface area of 216 units\r\n	\N	\N	a) x^3  b) 3.375,1000  c) x^2,6x^2  d) 13.5, 600 sq. cm  e) 6 cm on a side	Miranda	Jared, Hannah, Liam, Julia	1
302	6	32	For each of the following equations, find the x-intercept and y-intercept. Then use them to calculate the slope of the line.\r\n(a) 3x + y = 6 (b) x − 2y = 10 (c) 4x − 5y = 20 (d) ax + by = c		2014-07-29 07:06:53.307764	2014-10-21 14:20:32.594021	(a) 3x + y = 6    -> x intercept= 2    -> y-intercept = 6     -> slope=  -3\r\n(b) x − 2y = 10   -> x intercept= 10   -> y-intercept = -5    -> slope=  1/2\r\n(c) 4x − 5y = 20  -> x intercept= 5   -> y-intercept = -4     -> slope=  4/5\r\n(d) ax + by = c   -> x intercept= c/a  -> y-intercept = c/b   -> slope=  -a/b\r\n    ax = c           by = c          m = -(c/b)/(c/a)\r\n     x = c/a          y = c/b        m = -((c/b)(a/c))/((c/a)(a/c))   \r\n                                     m = -a/b	\N	\N	a) x:2, Y:6, m:-3  b) x:10, y:-5, m:1/2  c) 	Scott	Shantanu	1
310	1	33	A horse thief riding at 8 mph has a 32-mile head start. The posse in pursuit is riding at 10 mph. In how many hours will the thief be overtaken? [From The New Arithmetic, Seymour Eaton, 1885]		2014-07-29 07:37:35.208059	2014-10-23 14:02:12.406675	8h + 32 = 10h\r\n2h = 32\r\nh = 16, 16 hours\r\n\r\ncheck:  after 16 hours the thief has traveled (16*8)+32 or 160 miles, which equals 10 * 16.	\N	\N	16 hours	Jaden, Lucia, Miranda, Jason, Matt K.	Shantanu, Caroline, Nicole, Hannah, Simon	1
315	6	33	Sketch on the same axes the graphs of y = |x| and y = |x| − 2. Label the x- and y-intercepts. In what respects are the two graphs similar? In what respects do they differ?		2014-07-29 16:34:36.962457	2014-10-23 14:16:48.212341	The two graphs have the same shape, but the second one is shifted two units down the y axis.	\N	PBL_ans_33_6.PNG	--	Matt K.	Nicole	1
346	1	36	Sandy was told by a friend that “absolute value makes everything positive.” So Sandy rewrote the equation |x − 6| = 5 as x + 6 = 5. Do you agree with the statement, or with what Sandy did to the equation? Explain your answer.		2014-08-01 01:10:13.47576	2014-11-05 16:44:32.303616	No, absolute value makes the result of what is inside the vertical lines positive, but that doesn't mean that 'everything' is positive, just the result. So even though x + 6 = 5 gives one of the solutions, -1, it loses the other solution, 1, which results when the -5 result of 1-6 is changed to positive.	\N	\N	incorrect, multiple solutions	Scott	Jared, Hannah	1
368	4	38	(Continuation) One of your diagrams illustrates the equation x(2x + 2) = 2x2 + 2x.\r\nExplain. Write an equation that is illustrated by the other diagram.		2014-08-01 23:38:32.42037	2014-10-28 20:58:37.875672	below is x(2x + 2) = 2x^2 + 2x\r\n    XXXXXXXX|XXXXXXXXXXXX \r\n    X       |       | | X\r\n  x X       |       | | X\r\n    X       |       | | X\r\n    XXXXXXXX|XXXXXXXXXXXX\r\n        x       x    1 1\r\nThe other diagram illustrates 2x(x+1)\r\n    XXXXXXXX|XX Dimensions, 2x by x+1. Area 2x^2+2x\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    X-------| X\r\n    X       | X\r\n  x X       | X\r\n    X       | X\r\n    XXXXXXXX|XX\r\n        x    1\r\n	\N	\N	2x^2 + 2x			1
365	1	38	Which of the following could be the equation that is graphed on the calculator screen shown at right?\r\n(a) 3y − 7x = 28 (b) x + 2y = 5\r\n(c) 12x = y + 13 (d) y − 0.01x = 2000		2014-08-01 22:34:19.601173	2014-11-13 17:05:40.738638	Slope is around 1. y and x intercepts are the same distance from the origin, but y intercept is positive and x intercept is negative.\r\na) has a slope of 7/3, y intercept 28/3, x intercept -4, it could be this one, not the same as the picture but the axes could be scaled differently\r\nb) has a slope of -1/2, y intercept 5/2, x intercept 5, it can't be this one\r\nc) has a slope of 12, y intercept -13, x intercept 13/12, it can't be this one, \r\nd) has a slope of .01, y intercept 2000, x intercept -200000, the slope is shallow but we don't know the scale	PBL_graph_38_1.PNG	\N	a and d	Matt K	Simon	1
380	4	39	Draw a rectangle using one x2-block, three x-blocks and two 1-blocks to illustrate the equation x² + 3x + 2 = (x + 1)(x + 2). What are the dimensions of the rectangle? This equation is called an 'identity' because it is true no matter what value is assigned to x.		2014-08-02 21:40:58.236501	2014-11-17 15:06:25.363542	-\r\n    XXXXXXXXXXXXX\r\n    X       | | X\r\n  x X       | | X\r\n    X       | | X\r\n    X-----------X\r\n  1 X       | } X\r\n    XXXXXXXXXXXXX\r\n        x    1 1 	\N	\N	x+1 and x+2		Tori	1
388	1	40	The figure at right shows the graphs of two lines. Use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{ 4x + 3y = 20\r\n  3x − 2y = −5\r\nLee took one look at these equations and announced a plan: “Just multiply the first equation by 2 and the second equation by 3.” What does changing the equations in this way do to their graphs?		2014-08-02 23:08:00.496769	2014-11-19 14:40:02.496233	Estimate: (1.5,4.6)\r\nDoubling or tripling the graph doesn't change the slope or the intercepts as the ratios stay the same.\r\n	PBL_graph_40_1.PNG	\N	Graphs don't change	Suzana	Julia, Nicole	1
581	1	61	When I ask my calculator for a decimal value of √2, it displays 1.41421356237. What is the meaning of this number? To check whether this square root is correct, what needs\r\nto be done? Can the square root of 2 be expressed as a ratio of whole numbers — for example as 17/12? Before you say “impossible”, consider the ratio 665857/470832\r\n.		2014-08-14 05:02:58.239102	2015-02-04 17:21:13.059297	The number displayed on the calculator is as close as can be gotten given the finite number of decimal places that it can accurately calculate. You can check its correctness by multiplying it by itself, but even if it shows 2 with all zeros afterwards it doesn't mean it is 'correct'. The 'real' square root of two cannot be expressed as a ratio, as it has an infinite number of non-repeating digits, as does pi. It can be expressed to any desired level of precision, which is fine for any kind of actual calculating, so it depends on exactly what is meant by 'express'.	\N	\N	No, it can't	Jaden	Tori, Matt	1
350	5	36	The table shows the population of New Hampshire at the start of each of the last six decades.\r\n(a) Write an equation for the line that contains the data points for 1960 and 2010.\r\n(b) Write an equation for the line that contains the data points for 2000 and 2010.\r\n(c) Make a scatter plot of the data. Graph both lines on it.\r\n(d) Use each of these equations to predict the population of New Hampshire at the beginning of 2020. For each prediction, explain why you could expect it to provide an accurate forecast.		2014-08-01 02:31:02.339072	2014-11-11 15:02:36.035664	5a. y = 12629.88(x-1960)+606921 5b. y = 7805.7(x-2000)+1238415 5d. 1364714 from (a); 1394529 from (b)\r\n\r\na) 60,60.5921  and   110, 131.6472, for simplicity, call them 60, 60.6  and 110, 131.6\r\nSlope:  (131.6-60.6)/(110-60)   ->   71/50   ->  1.42\r\n131.6 = 1.42*110 + b  ->  131.6 = 156.2 + b   ->  b = -24.6\r\ny = 1.42x - 24.6\r\nb) 100, 123.8 and 110, 131.6\r\nSlope: (131.6-123.8)/10   ->  7.8/10   ->  .78\r\n131.6 = .78*110 + b  ->  131,6 - 85.8 = b   ->  b = 45.8\r\ny = .78x + 45.8\r\nc) attached\r\nd) first graph, about 1.46 million\r\n   second graph, about 1.4 million\r\nThe first graph takes into account the average change over 50 years, the second only 10 years of change. Either might produce an accurate forecast, depending on whether the slow down in the last decade represents a long term downward trend or is more of a random variation within a larger pattern.\r\n	PBL_graph_36_5.PNG	PBL_ans_36_5.PNG	y = 14191.02(x-1960)+606921		Hannah, Ben, Caroline	\N
392	5	40	Graph solutions on a number line: (a) |x+8| < 20 (b) |2x−5| ≤ 7 (c) 3|4−x| ≥ 12		2014-08-03 00:02:40.013729	2014-11-19 15:10:31.214253	a)\r\n |x + 8| < 20,  x + 8 = 20 or x + 8 = -20,  x < 12 and x > -28 are solutions, or -28 < x < 12\r\n---o====|====|====|====|====|====|====|====|====|====o----\r\n  -28  -24  -20  -16  -12  =8   -4    0    4    0   12\r\nb)|2x−5| ≤ 7,  2x-5 ≤ 7 or 2x - 5 ≤ -7,  2x ≤ 12 or 2x ≤ -2,   x ≤ 6 or x ≥ -1 or -1 ≤ x ≤ 6\r\n---*====|====|====|====|====|====|====*---\r\n  -1    0    1    2    3    4    5    6\r\nc) 3|4−x| ≥ 12,  |4 - x| ≥ 4, 4-x ≥ 4 or 4-x ≤ -4, -x ≥ 0 or -x ≤ -8, x ≤ 0 or x ≥ 8\r\n===|====*----|----|----|----|----|----|----|----*====|====\r\n  -1    0    1    2    3    4    5    6    7    8    9	\N	\N	a) -28 < x < 12  b) -1 ≤ x ≤ 6  c) x ≤ 0 or x ≥ 8	Avery	Henry, Shantanu	1
397	2	41	A large telephone company sent out an offer for pre-paid phone cards. The table below accompanied the ad and summarized their offer. Does this data form a linear relationship? Explain your answer. Which offer has the best rate per minute?		2014-08-03 17:11:23.884993	2014-11-20 15:50:17.228044	-\r\nmin       75    150    300    500    1000    1500\r\ncost    4.95   9.90  19.80  30.00   56.00   75.00\r\nrate   0.066  0.066  0.066   0.06    0.56    0.05\r\n\r\nThe rates are linear through 300 minutes, but not for the last three, since the price then goes down a little as more minutes are bought. The 1500 minute card has the best rate, assuming all the minutes are actually used.	PBL_graph_41_2.PNG	\N	not linear, 1500 min for $75	Suzana	Hannah, Nicole	1
401	6	41	The figure at right shows the graphs of two lines. Use the figure to estimate the coordinates of the point that belongs to both lines. The system of equations is\r\n{4x + 3y = 20\r\n  y = 2x − 2 }\r\nDale took one look at these equations and offered a plan: “The second equation says you can substitute 2x − 2 for y in the first equation. Then you have only one equation to solve.” Explain the logic behind Dale’s substitution strategy. Carry out the plan, and compare the exact coordinates of the intersection point with your estimates.		2014-08-03 20:50:35.246763	2014-11-20 16:17:16.420665	Estimate: (2.5,3.2)\r\nThe logic is that since the second equation tells us what y is in terms of x, we can substitute the x term in place of the y term, and the equation will still be equal.\r\n4x + 3y = 20\r\n y = 2x − 2\r\n4x + 3(2x - 2) = 20  ->  4x + 6x - 6 = 20  ->  10x = 26  ->  x = 13/5 or 2.6\r\ny = 26/5 - 10/5 = 16/5 or 3.2 - My estimates were very close\r\ncheck:  52/5 + 48/5 = 100/5 = 20	\N	\N	2.6, 3.2	Matt K	Tori	1
412	7	42	Sam boards a ski lift, and rides up the mountain at 6 miles per hour. Once at the top, Sam immediately begins skiing down the mountain, averaging 54 miles per hour, and does not stop until reaching the entrance to the lift. The whole trip, up and down, takes 40 minutes. Assuming the trips up and down cover the same distance, how many miles long is the trip down the mountain?		2014-08-04 02:20:25.948401	2014-11-25 15:20:28.275894	6u = 54d \r\n u = 9d\r\nu + d = 40\r\n10d = 40\r\nu = 4, 4 minutes to come down and 36 minutes on the way up. 6 mph is .1 miles per minute. .1 * 36 is 3.6 miles for the trip.\r\nCheck: 54 mph is .9 miles per minute. .9 * 4 = 3.6 miles for the downhill run.	\N	\N	3.6 miles	Matt K.	Hannah, Caroline	1
414	9	42	Your company makes spindles for the space shuttle. NASA specifies that the length of a spindle must be 12:45 ± 0:01 cm. What does this mean? What are the smallest and largest acceptable lengths for these spindles? Write this range of values as an inequality, letting L stand for the length of the spindle. Write another inequality using absolute values that models these constraints.		2014-08-04 05:42:51.999764	2014-11-25 15:24:05.727757	It means that there is an acceptable variation in length that is specified by how much longer or shorter is can be and still be acceptable.\r\nIn this case, the shortest acceptable spindle would be 12.44 cm, and the longest 12.46.\r\n12.44 <= L <= 12.46\r\n|12.45 - L| <= .01\r\n	\N	\N	between 12.44 and 12.46 cm,12.44<=L<=12.46, |L-12.45|<=0.01	Jaden	Ben	\N
641	6	68	Solving a quadratic equation by rewriting the left side as a perfect-square trinomial is called solving by 'completing the square'. Use this method to solve each of the following equations. Leave your answers in exact form.\r\n(a) x² − 8x = 3 (b) x² + 10x = 11 (c) x² − 5x − 2 = 0 (d) x² + 1.2x = 0.28		2014-08-17 04:13:03.740603	2015-02-24 17:36:48.223011	(a) x² − 8x = 3      -> x² − 8x + 16 = 3 + 16   -> x² − 8x + 16 = 19  -> (x-4)² = 19   ->  x-4 = √19  ->  x = 4±√19\r\n(b) x² + 10x = 11    -> x² + 10x +25 = 11 + 25  -> x² + 10x +25 = 36  -> (x+5)² = 36   =>  x+5 = √36  -> x = 5±6  -> 11, -1\r\n(c) x² − 5x − 2 = 0  -> x² − 5x = 2  -> x² − 5x + 6.25 = 8.25   ->  (x-2.5)² = √8.25  ->  x-2.5 = ±√8.25   ->  x= 2.5±√8.25  \r\n    x² − 5x − 2 = 0  -> x² − 5x = 2  -> x² − 5x + 6.25 = 8.25   ->  4x² - 20x - 25 = 33  (2x-5)² = √33  ->  2x = 5±√8.25   ->  x = (5±√33)/2\r\n(d) x² + 1.2x = 0.28 -> x² + 1.2x + .36 = .64  ->  (x+.6)² = .64  -> x+.6 = ±√.64  ->  x = -.6±.8  = x = -1.4, .2\r\n    x² + 1.2x = .28 ->  x² + 1.2x + .36 = .64  ->  (x+.6)² = .64  -> (10x+6)(10x+6) = ±√64  ->  10x = -6±8  = x = -1.4, .2	\N	\N	a) 4±√19  b) 1, -11  c)  x= 2.5±√8.25 or (5±√33)/2   d) -1.4, .2	Suzana, Scott	Shantanu	1
419	3	43	The fuel efficiency m (in miles per gallon) of a truck depends on the speed r (in miles per hour) at which it is driven. The relationship between m and r usually takes the form m = a|r − h| + k. For Sasha’s truck, the optimal fuel efficiency is 24 miles per gallon, attained when the truck is driven at 50 miles per hour. When Sasha drives at 60 miles per hour, however, the fuel efficiency drops to only 20 miles per gallon.\r\n(a) Find another driving speed r for which the fuel efficiency of Sasha’s truck is exactly 20 mpg.\r\n(b) Fill in the rest of the missing entries in the table. \r\n(c) Draw graph of m versus r, for 0 < r ≤ 80.\r\n(d) Find the values of k, a, and h.		2014-08-04 15:41:37.641662	2014-12-02 15:01:50.352035	a) 40 mph\r\nb) r   60  50  40  30  20  10\r\n   m   20  24  20  16  12   8\r\nc) attached\r\nd) m = a|r − h| + k\r\n  24 = a|50- h| + k\r\na = -2/5, h = 50, k = 24\r\n  m = -2/5|r-50| + 24	PBL_graph_43_3.PNG	\N	a) 40 mph  b) 20,16,12,8  c) graph   d) k = 24, a = -2/5, h = 50	Alex	Caroline	1
426	2	44	Sid has a job at Morgan Motors. The salary is $1200 a month, plus 3% of the sales price of every car or truck Sid sells (this is called a commission).\r\n(a) The total of the sales prices of all the vehicles Sid sold during the first month on the job was $72000. What was Sid’s income (salary plus commission)?\r\n(b) In order to make $6000 in a single month, how much selling must Sid do?\r\n(c) Write a linear equation that expresses Sid’s monthly income y in terms of the value x of the vehicles Sid sold.\r\n(d) Graph this equation. What are the meanings of its y-intercept and slope?		2014-08-04 19:43:13.241428	2014-12-03 16:09:34.514952	s) 1200 + 72000*.03 = $3360\r\nb) 1200 + .03s = 6000 ->  .03s = 4800 -> s = 160,000\r\nc) y = .03x + 1200\r\nd) 	\N	PBL_ans_44_2.PNG	a) $3360 b) $160,000 c) y = .03x + 1200 c) attached	Lucia	Nicole, Sam	1
435	11	44	The base of a rectangular tank is three feet by two feet, and the tank is three feet tall. The water in the tank is currently nine inches deep.\r\n(a) How much water is in the tank?\r\n(b) The water level will rise when a one-foot metal cube (denser than water) is placed on the bottom of the tank. By how much?\r\n(c) The water level will rise some more when a second one-foot metal cube is placed on the bottom of the tank, next to the first one. By how much?		2014-08-04 20:42:08.33258	2014-12-04 13:43:43.615768	a) 3*2*.75 = 4.5 cubic feet\r\nb) 5.5 = 3*2*h  ->  6h = 5.5  ->  ,91667 - .75 = 0.1667 feet, but it will be less because a little of the cube will be above the water, so we have to start over. The original base of the tank held 6 cf, so if we add the cube the bottom will now hold 5 cf. 4.5 cf will fill .9 of this, so the water level will be .9 feet or 10.8 inches, which means the water rises by 1.8 inches.\r\nc) 6.5 = 3*2*h  -> 6h = 6.5  -> 1.0833, the water will cover both cubes, now the bottom foot of the tank holds 4 cf, so there is .5 cf spread over the top 6 sf, so the depth will be .0833 ft or 1 inch, so the new depth is 13 inches, meaning the water rises 2.2 inches.	\N	\N	a) 4.5 cf  b) 1.8 inches  c)  2.2 inches	Matt K., Lucia		1
417	1	43	Jan has a 18"×18"×12" gift box that needs to be placed carefully into a 2′×2′×2′ shipping carton, surrounded by packing peanuts.\r\n(a) How many 1-cubic-foot bags of peanuts does Jan need to buy?\r\n(b) Jan opens one bag of peanuts and spreads them evenly on the bottom of the shipping carton. What is the resulting depth of the peanuts?\r\n(c) Jan centers the square base of the gift box on the peanut layer, pours in another bag of peanuts, and spreads them around evenly. Now how deep are the peanuts?\r\n(d) Explain why the third bag of peanuts will cover the gift box.		2014-08-04 06:35:00.749162	2014-12-03 16:06:54.540215	a) box capacity, 2x2x2 or 8 cubic feet. Size of package, 1.5x1.5x1, or 2.25 cubic feet, so she will need to buy 6 cubic feet of packing peanuts.\r\nb) 1 cubic foot = tx2x2 = 4t. t = 1/4 of a cubic foot, or 3 inches deep.\r\nc) Around the box there will be two areas 2'x.25'x1' and two areas 1.5'x.25'x1. The first area needs .5 cubic feet, while the second needs .375 each. So the total needed to reach the top of the box would be .5+.5+.275+.375, which is 1.75 cubic feet. The one cubic foot she adds will fill 1/1.75 of the space, or about .57 of it. Since the box is 12 inches tall, that means it will be filled about 6.86 inches.\r\nd) The third bag will cover the top because the second bag fills more than half of the space around the box. However she will need nearly three more bags as the upper 9 inches of the box are empty, and that makes about 3 cubic feet.	\N	\N	a) 6 cf  b) 3 in or 1/4 ft   c) 9.86 inches d) the 2nd bag covers more than half	Scott	Matt, Caroline	1
451	5	46	A slow 24-hour clock loses 25 minutes a day. At noon on the first of October, it is set to show the correct time. When will this clock next show the correct time?		2014-08-08 15:32:45.40278	2014-12-10 15:13:47.580194	To next show the correct time the clock would have to lose 24 hours, or 1440 minutes. 1440/25 = 57.6 days to lose 24 hours.\r\nAfter 31 days it becomes November, 57.6 - 31 leaves 26.6 days, so noon on November 26 + .6 of a day, which is 14.4 hours. That makes it 2 a.m. on Nov. 27 plus .4 hours, which is 24 minutes, so assuming the clock lost exactly 25 minutes every day the time would be 2:24 a.m. on November 28.\r\nIf it were a traditional 12 hour clock:\r\n12 hours = 720 minutes \r\nThe clock will lose 12 hours in 720/25 or 28.8 days. .8 of a day is 19.2 hours, or 19 hours and 12 minutes.\r\n28 days, 19 hours and 12 minutes from noon on Oct. 1 would be 7:12 a.m. on Oct. 29.\r\n	\N	\N	57.6 days, 2:24 a.m. on November 28	Scott	Liam	1
446	11	45	You have one x2-block, twelve 1-blocks (all of which you must use), and an ample supply of x-blocks. How many rectangles with different dimensions can you make? Draw an algebra-block diagram for each.		2014-08-08 01:06:58.95303	2014-12-08 15:24:24.523687	Graph attached. 3 different rectangles can be made - 1x12, 2x6, and 3x4 (assuming 12x1, 6x2 and 4x3 are not considered different)	\N	PBL_ans_45_11.PNG	3 possible rectangles	Maya	Tori	1
447	1	46	After a weekend of rock-climbing in the White Mountains, Dylan is climbing down a 400-foot cliff. It takes 20 minutes to descend the first 60 feet. Assuming that Dylan makes progress at a steady rate, write an equation that expresses Dylan’s height h above level ground in terms of t, the number of minutes of descending. Use your equation to find how much time it will take Dylan to reach level ground.		2014-08-08 01:11:16.271077	2014-12-08 15:25:32.281556	Down 60 feet in 20 minutes means a descent rate of 3 feet per minutes.\r\nh = 400 - (3t)\r\n0 = 400 - 3t\r\n3t = 400\r\nt = 133.33 minutes to reach the bottom	\N	\N	h = 400 - (3t), 2 hours, 13 minutes, 20 seconds to reach the bottom.	Maya	Nicole, Julia	1
480	4	49	Find the value of p that makes the linear graph y = p − 3x pass through the point where the lines 4x − y = 6 and 2x − 5y = 12 intersect.		2014-08-09 15:21:28.602151	2014-12-18 15:22:24.134666	    4x −  y = 6\r\n    2x − 5y = 12\r\n    4x −  y = 6\r\nx2  4x −10y = 24\r\n-        9y = -18\r\n          y = -2\r\n          x = 1    check: 2 - -10 = 12\r\n-2 = p - 3\r\n   p = 1	\N	PBL_ans_49_4.PNG	p = 1	Maya	Henry, Matt L.	1
481	5	49	Faced with the problem of multiplying 5^6 times 5^3, Brook is having trouble deciding which of these four answers is correct: 5^18, 5^9, 25^18, or 25*9. Your help is needed. Once you have answered Brook’s question, experiment with other examples of this type until you are able to formulate the 'common-base principle for multiplication' of expressions bm · bn.		2014-08-09 15:26:19.42402	2015-01-06 16:11:00.200076	It is 5^9, since 5^3 is 5*5*5 and e^6 is c, so multiplying them is just (5*5*5)*(5*5*5*5*5), or (5*5*5*5*5*5*5*5) or 5^9\r\nThe principle is x^a * x^b is x^(a+b)	\N	\N	5^9 is correct, x^(a+b) or b^(m+n)	Avery	Sam, Tori	1
464	9	47	When asked to solve the system of equations \r\n{ 5x + 2y = 8\r\n  x − 3y = 22\r\nKelly said “Oh that’s easy — you just set them equal to each other.” Looking puzzled, Wes replied “Well, I know the method of 'linear combinations', and I know the method of 'substitution', but I do not know what method you are talking about.” First, explain each of the methods to which Wes is referring, and show how they can be used to solve the system. Second, explain why Wes did not find sense in Kelly’s comment. Third, check that your answer agrees with the diagram.		2014-08-09 00:01:24.248874	2014-12-11 16:08:58.755944	Linear combinations would mean adjusting one or both of the equations so that one variable term was either the same or the exact opposite of it in the other equation. Then that variable can be eliminated either by adding or subtracting one equation from the other, and solving the resulting equation.\r\nSubstitution would mean defining one variable in terms of the other, and then substituting the new term in one of the equations so it has only a single variable conducive to easy solving.\r\nIt's not clear what Kelly means as each equation already has an equal sign in it, so they can't just be set equal to each other.\r\n 5x + 2y = 8\r\n  x − 3y = 22\r\n 5x + 2y = 8\r\n 5x − 15y = 110\r\n      17y = -102\r\n        y = -6\r\nx - -18 = 22\r\nx = 4\r\nThe answer agrees with the diagram.\r\n	PBL_graph_47_9.PNG	\N	4,-6	Avery 	Jarod, Nicole, Hannah	1
488	3	50	Sage has a walking speed of 300 feet per minute. On the way to gate 14C at the airport, Sage has the option of using a moving sidewalk. By simply standing on the sidewalk, it would take 4 minutes to get to the gate that is 800 feet away.\r\n(a) How much time will Sage save by avoiding the moving sidewalk, walking instead on the floor next to it?\r\n(b) How much time will be saved by walking on the moving sidewalk?\r\n(c) After traveling 200 feet (by standing on the sidewalk), Sage notices a Moonbucks, and turns around on the sidewalk. How long does it take to get back to the beginning of the sidewalk, walking in the opposite direction? Assume the sidewalk is empty of other travelers.		2014-08-09 19:07:44.022388	2015-01-07 17:03:46.786081	a) 800/300, 4 - 2.67 minutes ->  1.33 minutes, or 1 minute 20 seconds.\\\r\nb) sidewalk 200 fpm, 800/500 = 1.6 minutes, so 2.4 minutes would be saved.\r\nc) 300-200= 100 feet per second. 2 minutes to get back.	\N	\N	a) 1:20  (2:40) b) 1:36, 1:04  c) 2:00	Lucia	Caroline, Jared	1
484	8	49	(Continuation) Let r equal the number of right answers and w equal the number of wrong answers. Write an equation relating r and w that states that the test grade is 94. Write an inequality that states that the grade is at least 94, and graph it. Also graph the inequalities 0 ≤ r, 0 ≤ w, and r + w ≤ 100, and explain why they are relevant here. Shade the region that solves all four inequalities. How many lattice points does this region contain? Why is this a lattice-point problem? What is the maximum number of wrong answers one could get and still obtain a grade at least as good as 94?		2014-08-09 18:35:10.994389	2015-01-06 16:20:07.366781	r - .5w = 94\r\nr - .5w >= 94\r\nThe three inequalities are relevant because you can't get a negative number of answers right or wrong, and the maximum score is 100.\r\nThe region contains 19 lattice points.\r\nThis is a lattice point problem because only integer or half integer scores are possible.\r\nFour is the maximum number of wrong answers that could still reach 94 as if you have 5 wrong you lose 2.5 points from a beginning score of 95. 	\N	PBL_ans_49_8.PNG	r - 2w = 94,  r - 2w >= 94, 19 lattice points, 4 is the maximum wrong to get 94	Zach	Hannah, Jared	1
511	5	52	Do the three lines 5x− y = 7, x+3y = 11, and 2x+3y = 13 have a common point of intersection? If so, find it. If not, explain why not.		2014-08-11 00:45:48.463148	2015-01-13 15:18:41.968518	5x− y = 7 ->  y = 5x - 7\r\nx+3y = 11 ->  3y = -x + 11  ->  y = -x/3 + 11/3\r\n2x+3y = 13 -> 3y = -2x + 13 ->  y = -2x/3 + 13/3\r\nGraphing them, they all meet at (2,3)\r\nchecking: 10-3 = 7,  2+9 = 11, and 4+9 = 13, confirming that (2,3) is true for all three equations.	\N	PBL_ans_52_5.PNG	2,3	Matt V.	Sam, Nicole, Shantanu	1
514	8	52	Mackenzie can spend at most 2 hours on math and biology homework tonight. Biology reading always takes at least 45 minutes, but, because there is also a math hand-in due tomorrow, Mackenzie knows that math is going to require more time than biology. \r\n(a) Using the variables m and b, express the constraints on Mackenzie’s study time by a system of inequalities. Work in minutes.\r\n(b) Graph the inequalities with m on the horizontal axis and b on the vertical axis, and highlight the region that satisfies all three inequalities. Such a region is called a 'feasible region', because every point in the region is a possible (feasible) solution to the system.\r\n(c) Is the point (60, 50) in the feasible region?		2014-08-11 03:38:42.274659	2015-01-13 15:25:54.890003	b >= 45\r\nb + m <= 120\r\nm > b\r\nYes, the point (60,50) is in the feasible region as it must be as the biology time is greater than 45, the sum is less than 120, and the math time is greater than the bio time.\r\n	\N	PBL_ans_52_8.PNG	a) b >= 45, b + m <= 120, m > b,  c) yes	Maya	Julia	1
494	1	51	The perimeter of a square is p inches. Write expressions, in terms of p, for the length of the side of the square and the area of the square.		2014-08-09 21:18:28.693812	2015-01-09 14:48:40.016031	side is p/4\r\narea is (p/4)², or (p²)/16	\N	\N	p/4, p²/16	Zach	Ben, Henry	1
501	8	51	Pat is the CEO of Pat’s Pickle-Packing Plant, but can still pack 18 jars of pickles per hour. Kim, a rising star in the industry, packs 24 jars per hour. Kim arrived at work at 9:00 am one day, to find that Pat had been packing pickles since 7:30 am. Later that day, Kim had packed exactly the same number of jars as Pat. At what time, and how many jars had each packed?		2014-08-10 15:30:53.211578	2015-01-09 15:25:45.250008	24t = 18(t+1.5)\r\n24t = 18t + 27\r\n6t = 27\r\nt = 27/6 or 4.5 hours\r\nThey had packed the same amount at 1:30 p.m.\r\n4.5 * 24 = 108 jars by Kim\r\n6 * 18 = 108 jars by Pat\r\n\r\n	\N	\N	1:30 p.m., 108 jars	Lucia	Caroline	1
507	1	52	A 'monomial' is a constant or a product of a constant and variables. If some variable factors occur more than once, it is customary to use positive integer exponents to consolidate them. Thus 12, 3ax2, and x5 are monomials, but 3xy4 + 3x4y is not. Rewrite each of these monomials:\r\n(a) x · x^2 · x^3 · x^4 (b) (2x)^7 (c) (2w)^3 · 5w^3 (d) 3a^4 · ( 1/2 b)^3 · ab^6		2014-08-10 17:02:41.978077	2015-01-13 14:54:05.321227	(a) x · x^2 · x^3 · x^4         -> x^10\r\n(b) (2x)^7                      -> ((2x)^7)\r\n(c) (2w)^3 · 5w^3               -> 40w^6\r\n(d) 3a^4 · ( 1/2 b)^3 · ab^6    -> 3/8(a^5*b^9)	\N	\N	a) x^10  b) 128x^7 c) 40x^6  d) 3/8 a^5 b^9	Scott	Ben, Julia	1
524	3	54	Blair runs a kiosk at the local mall that sells sweatshirts. There are two types of shirts sold. One is 100% cotton, on which the markup is $6 per shirt. The other is a cotton and polyester blend, on which the markup is $4 per shirt. It costs Blair $900 per month to rent the kiosk. Let c represent the number of pure cotton sweatshirts sold in one month and b the number of blended sweatshirts sold in the same month.\r\n(a) In terms of c and b, write an inequality that states that Blair’s sales will at least meet the monthly rental expense. Sketch a graph.\r\n(b) This month, Blair could only get 20 of the pure cotton shirts from the distributor. This adds another constraint to the system. How does it affect the region you drew in (a)?		2014-08-11 19:11:09.874559	2015-01-15 16:45:51.899518	a) 6c + 4b ≥ 900, graph attached\r\nb) Since the maximum number of cotton shirt sales is 20, the region is now limited to the upper left, which represents 20 or fewer cotton shirts sold, and the number of poly shirts needed to be sold to exceed the rental charge.\r\n\r\n	\N	PBL_ans_54_3.PNG	a) 6c + 4b ≥ 900   b) c ≤ 20	Alex	Caroline, Jarod	1
520	6	53	Population data for Vermont is given in the table at right.\r\n(a) Find the average annual growth rate of this population during the time interval from 1970 to 2010.\r\n(b) Write an equation for a line in point-slope form, using the ordered pair (1970, 448327) and the slope you found in part (a).\r\n(c) Evaluate your equation for the years 1980 and 1990, and notice that these interpolated values do not agree with the actual table values. Find the size of each error, expressed as a percent of the actual population value.\r\n(d) Use your point-slope equation to extrapolate a population prediction for 2020.\r\n(e) New Hampshire has roughly the same area as Vermont, but its population reached one million several years ago. Predict when this will happen to Vermont’s population.		2014-08-11 07:27:42.061765	2015-01-14 16:16:03.014945	a) (625741-448327)/40 = 4435.35 people per year.\r\nb) (y - 448327) = 4435.35(1980 - 1970)  ->  492,680.5\r\n   (y - 448327) = 4435.35(1990 - 1970)  ->  537,034\r\nc) Both years are low compared to the actual data.\r\n   511456-492680.5 = 18775.5      => 3.7% low\r\n   564964-537034   = 27930        -> 4.9% low   \r\nd) (y - 448327) = 4435.35(2020 - 1970)  ->  670,094.5\r\ne) 1,000,000-625641/4435.35 = 84.4 years, or in 2094	PBL_graph_53_6.PNG	\N	a) 4435.35 people per year  b) (y - 448327) = 4435.35(x - 1970)  c) 3.7%, 4.9%  d) 670,094  e) 2094	Suzana	Hannah, Simon	1
541	2	56	Sid’s summer job is working at a roadside stand that specializes in homemade ice cream. The manager asks Sid to order small plain cones and extra-large sugar cones. The storage room will hold at most 12 boxes of cones. A box of small plain cones cost $30 and a box of extra-large sugar cones cost $90 dollars. A maximum of $800 is budgeted for this purchase of cones.\r\n(a) Using p for the number of boxes of plain cones and s for the number of boxes of sugar cones, translate the conditions of the problem into a system of inequalities.\r\n(b) Graph this sytstem of inequalities and shade the feasible region for this problem. Identify the vertices of the region by specifying their coordinates.		2014-08-12 15:09:05.610607	2015-01-23 15:40:17.509503	P + s <= 12\r\ns <= 12 - p\r\n30p + 90s <= 800\r\n9s = 80 - 3p\r\ns = 80/9 - p/3\r\n	\N	PBL_ans_56_2.PNG	a) p+s ≤ 12, p≥0, s≥0  b) (0,12), (0,80/9) , (14/3,22/3), (0,0)	Scott	Caroline	1
527	6	54	During 2010, it is estimated that the world consumed 5.20 × 10^17 BTUs (British Thermal Units) of energy.\r\n(a) Describe this estimate of world energy use in quadrillions of BTUs. It is now customary to refer to one quadrillion of BTUs as simply a 'quad'.\r\n(b) One barrel of oil produces 5800000 BTUs. How many barrels of oil produce one quad?\r\n(c) The world is consuming oil at approximately 87 million barrels per day. What is the percentage of world energy consumption attributable to oil?		2014-08-11 19:42:55.409882	2015-01-15 17:20:53.243383	a) 10^3 = 1,000, 10^6 = 1,000,000, 10^9 = 1,000,000,000, 10^12 = 1,000,000,000,000, 10^15 = 1,000,000,000,000,000\r\n       Thousand         Million           Billion                Trillion                   Quad\r\n5.20 × 10^17 BTUs is 520 * 10^15, so it is 520 quads.\r\nb) 10^15/(5.8*10^6)  ->  172413793 barrels\r\nc) 87,000,000*365 = 3.175*10^10 barrels per year.\r\n   3.175^10^10 * 5.8*10^6 =  1.84179*10^17\r\n1.84179/5.2 = 35.42, Oil makes up about 35.42% of the world's energy consumption.\r\n   	\N	\N	a) 520 quads   b) 1.72413793 x 10^8   c) 35.42%	Scott	Hannah, Jarod	1
549	3	57	A number trick . Arrange the nonnegative integers into seven infinite columns, as shown in the table at right. Without telling you what they are, someone selects two numbers, one from the 2-column (the column that contains 2) and one from the 5-column, and multiplies them. You predict the column in which the answer will be found. How?		2014-08-12 16:41:01.241237	2015-01-28 19:01:03.646322	The answer will always be in column 3.\r\nThe column is essentially an offset multiplication table; multiplying from any two columns will end up with all results in a particular column. \r\nMultiplying 2 and 5 makes 10, so every result will be some multiple of 7 + 10. Column 0 is straight multiples of 7, so column 3 will contain multiples of 7 + 10, or 7+7+3. So the product of columns 2 and 5 must always end up in row 3. \r\nUsing a similar analysis, product of columns 2 and 4 must always be a multiple of 7 + 8, or 7+7+1, which means the answer will always be in column 1.	PBL_graph_57_3.PNG	\N	Answer will be in column 3	Lucia	Jared	1
557	2	58	Robin works part-time carving wooden seagulls and lobsters to sell to tourists during the summer season. Keeping up with demand means carving at least two seagulls and three lobsters a day. Robin can produce at most a dozen models a day.\r\n(a) Using x for the number of seagulls and y for the number of lobsters, write three inequalities that describe Robin’s daily limitations. Graph the feasible region.\r\n(b) In June, each seagull model brought a $6 profit and each lobster model brought a $4 profit. Write an expression for Robin’s total profit on x seagulls and y lobsters.\r\n(c) Draw on your graph the line that states that Robin’s profit is $48. Do all the points on this line have meaning in this context? Which combinations of seagulls and lobsters produce a profit of exactly $48?		2014-08-13 06:02:38.422951	2015-01-29 14:57:04.263141	a) x >= 2, y >= 3, and x + y <= 12\r\nb) 6x + 4y = total profit\r\nc) 6x + 4y = 48\r\n   4y = -6x + 48\r\n    y = -3x/2 + 12\r\nThe only points that have meaning are those in which x and y are integers, since Robin can't sell a partial carving.\r\nA profit of $48 is produced by (2,9), (4,6), (6,3)	\N	PBL_ans_58_2.PNG	a) x >= 2, y >= 3, and x + y <= 12  b) p = 6x + 4y   c) (2,9), (4,6), (6,3)	Scott, Avery	Henry	1
562	7	58	Faced with the problem of dividing 5^24 by 5^8, Brook is having trouble deciding which of these four answers is correct: 5^16, 5^3, 1^16, or 1^3. Your help is needed. Once you have answered Brook’s question, experiment with other examples of this type until you are ready to formulate the 'common-base principle for division' that tells how to divide b*m by b^n and get another power of b. Then apply this principle to the following situations:\r\n(a) Earth’s human population is roughly 6 × 10^9, and its total land area, excluding the polar caps, is roughly 5 × 10^7 square miles. If the human population were distributed uniformly over all available land, approximately how many persons would be found per square mile?\r\n(b) At the speed of light, which is 3 × 10^8 meters per second, how many seconds does it take for the Sun’s light to travel the 1.5 × 10^11 meters to Earth?		2014-08-13 06:54:26.700739	2015-01-29 15:14:33.475896	5^24/5^8 = 5^16\r\nSubtract the denominator exponent from the numerator exponent. \r\nx^8/x^5 is x*x*x*x*x*x*x*x/x*x*x*x*x. There are 5 x/x factors that simplify to 1, leaving x*x*x or x^3\r\na) 6 × 10^9/5 × 10^7 = 6/5 * 10^2 or about 120.\r\nb) 1.5 × 10^11/3 × 10^8   .5*10^3 or about 500 seconds.	\N	\N	5^16 , subtract the denom from the numerator a) 120  b) 500 sec. or 8.33 min	Alex	Julia, Caroline, Hannah, Sam	1
565	3	59	At noon, a team bus left Exeter for Deerfield. Soon thereafter, PEA’s first-line player Brett Starr arrived at the gym. A loyal day-student parent volunteered to overtake the bus and deliver Brett. The two left at 12:15 pm. The parent drove at 54 mph, while ahead of them the ancient yellow bus poked along at 48 mph. Did the car catch the bus before it reached Deerfield, which is 110 miles from Exeter? If so, where and when?		2014-08-13 15:53:03.703671	2015-02-02 16:48:35.102475	t = time in hours from noon\r\n48t = 54(t - .25)\r\n48t = 54t - 13.5\r\n6t = 13.5\r\nt = 2.25 hours\r\n48*2.25 = 108 miles traveled.\r\nThe two met at 2:15 p.m. after traveling 108 miles, which was in time. (2.5 minutes before the bus would have reached Deerfield.)\r\ncheck: 2 * 54 = 108\r\n	\N	\N	2:15 p.m., 2 miles from Deerfield	Avery	Caroline	1
577	5	60	Jess is running around a circular track, one lap every 40 seconds. Mackenzie is also running at a constant speed around the same track, but in the opposite direction. They meet every 15 seconds. How many seconds does it take Mackenzie to do one lap?		2014-08-14 04:28:23.076665	2015-02-04 16:57:03.615513	In the first 15 seconds Jess will run 15/40 of a lap, or 3/8, if Mackenzie is to meet her going the other way she will have to do 25/40 of a lap, or 5/8, so she will have to run 5/3 faster than Jess. If Jess takes 40 seconds, Mackenzie has to do each lap in 3/5 of 40 or 24 seconds.\r\nJess\t\t   Mack\t\r\nDistance   Time\t   Distance\tMeet #\r\n0\t     0\t   0\t        0\r\n0.375\t    15\t   0.625\t1\r\n0.75\t    30\t   1.25\t        2\r\n1.125\t    45\t   1.875\t3\r\n1.5\t    60\t   2.5\t        4\r\n1.875\t    75\t   3.125\t5\r\n2.25\t    90\t   3.75\t        6\r\n2.625\t   105\t   4.375\t7\r\n3\t   120\t   5\t        8\r\n	\N	\N	24 seconds	Lucia	Julia, Caroline	1
591	2	62	If √2 can be expressed as a ratio r/p of two whole numbers, then this fraction can be put in lowest terms. Assume that this has been done.\r\n(a) Square both sides of the equation √2 = r/p.\r\n(b) Multiply both sides of the new equation by p². The resulting equation tells you that r must be an even number. Explain.\r\n(c) Because r is even, its square is divisible by 4. Explain.\r\n(d) It follows that p² is even, hence so is p. Explain.\r\n(e) Thus both r and p are even. Explain why this is a contradictory situation.\r\nA number expressible as a ratio of whole numbers is called 'rational'. All other numbers, such as √2 , are called 'irrational'.		2014-08-14 23:50:44.878147	2015-02-05 19:17:41.282399	a) 2 = (r/p)² = r²/p²\r\nb) 2p² = r², r must be even because r² is 2 times some number, and r*r can't produce 2 as a result of multiplying numbers without including 2, since 2 is prime. If r were odd, r² would be odd as the product of two odd numbers.\r\nc) Its square is the product of two even numbers, so it must have 4 as a factor.\r\nd) Since p² equals a number with an even factor, p must be even. If p were odd p² would be odd and LHS would not be divisible by 4.\r\ne) If both the numerator and denominator are even, the fraction can't be in lowest terms, as both the top and bottom are divisible by two.	\N	\N	a) 2 = r²/p²  b) 2p² = r²   c) must include 2*2  d)  same as b e) not in lowest terms	Maya	Caroline	1
592	3	62	An avid gardener, Gerry Anium just bought 80 feet of decorative fencing, to create a border around a new rectangular garden that is still being designed.\r\n(a) If the width of the rectangle were 5 feet, what would the length be? How much area would the rectangle enclose? Write this data in the first row of the table.\r\n(b) Record data for the next five examples in the table.\r\n(c) Let x be the width of the garden. In terms of x, fill in the last row of the table.\r\n(d) Use your calculator to graph the rectangle’s area versus x, for 0 ≤ x ≤ 40. As a check, you can make a scatter plot using the table data. What is special about the values x = 0 and x = 40?\r\n(e) Comment on the symmetric appearance of the graph. Why was it predictable?\r\n(f) Find the point on the graph that corresponds to the largest rectangular area that Gerry can enclose using the 80 feet of available fencing. This point is called the 'vertex'.		2014-08-15 00:22:07.486542	2015-02-06 15:07:56.608426	a)  width  length   area\r\n     5       35     175\r\nb)   9       26     234\r\n    16       24     384\r\n    22       18     396  \r\n    24       16     384\r\n    35        5     175\r\nc)   x   (40-x)  - x² + 40x\r\nd) attached, x = 0 and x = 40 are the intercepts where y is 0 and the problem loses its context.\r\ne) The symmetry is predictable since the width and length are opposites of each other, and the bottom part of the chart is the reverse of the top. \r\nf) ( width 20, length 20), when the garden is square, area 400. So vertex is 20,400	PBL_graph_62_3.PNG	PBL_ans_62_3.PNG	a) 5,35,175 b) table c) x   (40-x)  40x - x²   d) intercepts f) 20,400	Scott		1
609	7	64	Golf math I . Using a driver on the 7th tee, Dale hits an excellent shot, right down the middle of the level fairway. The ball follows the parabolic path shown in the figure, described by the quadratic function y = 0.5x−0.002x². This relates the height y of the ball above the ground to the ball’s progress x down the fairway. Distances are measured in yards.\r\n(a) Use the distributive property to write this equation in factored form. Notice that y = 0 when x = 0. What is the significance of this data?\r\n(b) How far from the tee does the ball hit the ground?\r\n(c) At what distance x does the ball reach the highest point of its arc? What is the maximal height attained by the ball?		2014-08-15 16:06:11.023282	2015-02-12 17:22:39.789252	a) y = x(0.5−0.002x), when x = 0 the ball is on the tee, with a height and distance of 0.\r\nb) 0 = 0.5−0.002x  ->  0.002x = 0.5   x = 250 yards\r\nc) y = 0.5*125 - .002(125^2)  ->  62.5 - 31.25 = 31.25 yards is the maximum hegight	PBL_graph_64_7.PNG	\N	a) y = 0.5x(0.5−0.004x)  b) 250 yards  c) 125 yards, 31.25 yards	Lucia		1
619	1	66	At Sam’s Warehouse, a member pays $25 a year for membership, and buys at the regular store prices. A non-member does not pay the membership fee, but does pay an additional 5% above the store prices. Under what conditions would it make sense to buy a membership?		2014-08-16 03:47:18.396258	2015-02-19 14:59:52.750805	Since you save 5% on all purchases as a member, it makes sense to get one if you're going to spend enough to get more than $25 in savings.\r\n.05x = 25\r\nx = 500\r\nIf you expect to spend more than $500 in a year then the membership makes sense.\r\ncheck: 5% of 500 = 25	\N	\N	if you expect to spend more than $500	Zach	Caroline	1
629	1	67	Near the surface of the earth, assuming negligible resistance from the air, the height in feet of a falling object is modeled well by the equation y = h − 16t², where y is the height of the object, t is the number of seconds the object has been falling, and h is the height from which the object was dropped.\r\n(a) If an iron ball were dropped from the Washington Monument, which is 555 feet high, how far above the ground would the ball be after 2 seconds of falling? How long would it take for the ball to hit the ground?\r\n(b) Due to air resistance, a falling bag of corn chips will not gain speed as rapidly as a falling iron ball. Cal Elayo, a student of science, found that the descent of a falling bag of chips is modeled well by the equation y = h−2.5t². In an historic experiment, Cal dropped a bag of chips from a point halfway up the Monument, while a friend simultaneously dropped the iron ball from the top. After how many seconds did the ball overtake the bag of chips?\r\n(c) Graph the equations y = 277.5−2.5t² and y = 555−16t² on the same system of axes. Calculate the y- and t-intercepts of both curves. What is the meaning of these numbers? Notice that the curves intersect. What is the meaning of the intersection point?		2014-08-16 20:22:57.016306	2015-02-18 15:27:37.80757	a) y = 555 − 16(2²) ->  y = 555 - 64  ->  y = 491\r\n   0 = 555 = 16(t²) ->  16t² = 555 -> t² = 34.6875   t = 5.890 seconds\r\nb) 277.5−2.5t² = 555−16t^2\r\n   16t^2-2.5t² = 555-277.5\r\n        13.5t² = 277.5\r\n            t² = 20.555\r\n              t = 4.534 seconds when the ball overtakes\r\nc) y = 555 − 16(t²) -> y intercept is 555\r\n   x intercepts -> sqrt(555/16) = +-5.8896\r\n   y = 277.5 - 2.5t² -> y intercept is 277.5\r\n   x intercepts -> sqrt(277.5/2.5) = 10.536\r\nThe y intercept is the height from which the object is dropped. \r\nThe x intercept is the time when it hits the ground.	\N	PBL_ans_66_10.PNG	a) 491 ft, 5.89 sec   b) 4.53 sec   c) chips- y-int = 277.5, x int = 10.54,  iron ball - y-int = 555, x-int = 5.89  y-int height, x int time, intersection when they cross =	*Lucia		1
621	3	66	Golf math II . Again using a driver on the 8th tee, which is on a plateau 10 yards above the level fairway, Dale hits another fine shot. Explain why the quadratic function y = 10 + 0.5x − 0.002x² describes this parabolic trajectory, shown in the figure above. Why should you expect this tee shot to go more than 250 yards? Estimate the length of this shot, then use your calculator to find a more accurate value. How does this trajectory relate to the trajectory for the drive on the previous hole?		2014-08-16 14:45:59.706204	2015-02-19 15:16:41.132863	It makes sense to add 10 to the previous function because instead of starting from 0, the ball is now starting from an elevated position relative to where it will land. The ball should go farther than 250 yards because it will take longer to hit the ground. I estimate 275 yards. On the calculator the distance is about 268.04. The trajectory is basically the same, but we are selecting a slightly different portion of the parabola.\r\n \r\n	PBL_graph_66_3.PNG	PBL_ans_66_3.PNG	268.6 yds	Scott	Caroline, Jared	1
648	7	69	(Continuation) Copy the accompanying tables into your notebook and fill in the missing entries. Notice that the third column lists the differences between successive y-values. Is there a pattern to the column of differences? Do the values in this column describe a linear function? Explain. As a check, create a fourth column that tables the differences of the differences. How does this column help you with your thinking?		2014-08-18 00:43:44.366867	2015-02-24 15:35:07.864993	  x  y  diff d/d\r\n  0  0       \r\n  1  1   1\r\n  2  4   3   2\r\n  3  9   5   2\r\n  4 16   7   2\r\n  5 25   9   2\r\nThe column of differences is a list of odd numbers, it describes a linear function since the change from number to number is constant. The fourth column illustrates this.	PBL_graph_69_7.PNG	\N	odd numbers, constant increase of 2 in third column			1
653	2	70	A hose used by the fire department shoots water out in a parabolic arc. Let x be the horizontal distance from the hose’s nozzle, and y be the corresponding height of the stream of water, both in feet. The quadratic function is y = −0.016x² + 0.5x + 4.5.\r\n(a) What is the significance of the 4.5 that appears in the equation?\r\n(b) Use your calculator to graph this function. Find the stream’s greatest height. \r\n(c) What is the horizontal distance from the nozzle to where the stream hits the ground?\r\n(d) Will the stream go over a 6-foot high fence that is located 28 feet from the nozzle?\r\nExplain your reasoning.		2014-08-18 01:52:57.586307	2015-02-24 15:50:09.745482	a) That is the height that the hose is held about the ground.\r\nb) 8.40625\r\nc) 38.54\r\nd) no, when x = 28 y is less than 6 (5.96)	\N	\N	a) height of nozzle  b) 8.41  c) 38.6  d) n, when x is 28 y is 5.96			1
661	1	71	The height h (in feet) above the ground of a baseball depends upon the time t (in seconds) it has been in flight. Cameron takes a mighty swing and hits a bloop single whose height is described approximately by the equation h = 80t − 16t2. Without resorting to graphing on your calculator, answer the following questions:\r\n(a) How long is the ball in the air?\r\n(b) The ball reaches its maximum height after how many seconds of flight?\r\n(c) What is the maximum height?\r\n(d) It takes approximately 0.92 seconds for the ball to reach a height of 60 feet. On its way back down, the ball is again 60 feet above the ground; what is the value of t when this happens?		2014-08-18 03:11:21.291473	2015-02-24 16:08:23.279724	a) 80 - 16t = 0  -> 16t = 80 -> t = 5, ball is in the air for 5 seconds\r\nb) 2.5 seconds\r\nc) 80*2.5 - 16*2.5*2.5 = 2.5(80-40) = 2.5*40 = 100 feet \r\nd) 5-.92 or 4.08 seconds	\N	\N	a) 5 sec  b)  2.5 sec  c) 100 feet  d) 4.08 sec			1
639	4	68	At noon one day, Allie left home to make a long bike ride to the family camp on Mud Lake, a distance of 100 km. Later in the day, the rest of the family packed some things into their van and drove to the lake along Allie’s bike route. They overtook Allie after driving for 1.2 hrs, stopped long enough to put Allie and bicycle in the van, and continued to the camp. Refer to the graph as you answer the following questions about the day’s events:\r\n(a) Allie pedaled at two different rates during the biking part of the trip. What were they?\r\n(b) After biking for a while, Allie stopped to take a rest. How far from home was Allie then? How long did Allie rest?\r\n(c) How far from home was Allie when the family caught up?\r\n(d) At what time did the family arrive at the camp?\r\n(e) At what time would Allie have arrived, if left to bicycle all the way?\r\n(f) What distance separated Allie and the rest of the family at 5 pm?		2014-08-17 04:07:12.784558	2015-02-24 17:19:03.00475	a) 20 kph and 10 kph\r\nb) 40 k from home, 30 minutes\r\nc) ~72 km\r\nd) 6:10 p.m.\r\ne) 8:30 p.m.\r\nf) 35 km	PBL_graph_68_4.PNG	\N	a) 20 and 10 kph   b) 40k, 30 min  c) ~72 km  d) 6:10 p.m.  e) 8:30 p.m.  f) 35 km	Maya	Nicole	1
646	5	69	In your notebook, use one set of coordinate axes to graph the three curves y = x² −x, y = x²+2x, and y = x²−4x. Make three observations about graphs of the form y = x²+bx, where b is a nonzero number.		2014-08-18 00:35:19.778686	2015-02-25 19:13:24.632497	1) All of these graphs pass through (0,0)\r\n2) The other x intercept is -b, which makes sense since x² ±bx has to be zero.\r\n3) Thus, the x coordinate of the vertex is ±b/2, depending on the sign of b.\r\n4) The parabola points upwards	\N	PBL_ans_69_5.PNG	all pass through (0,0), other intercept is -b, axis of symmetry is x = -b/2	Miranda	Shantanu, Caroline, Sam	1
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('questions_id_seq', 858, true);


--
-- Data for Name: questions_topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY questions_topics (question_id, topic_id) FROM stdin;
3	3
1	4
82	5
82	1
27	6
71	7
83	5
84	4
84	5
85	8
86	1
85	1
87	6
88	9
89	9
90	1
81	6
91	1
91	10
92	1
92	8
92	10
94	1
94	9
80	1
80	9
2	8
7	4
7	5
93	6
79	6
78	1
77	6
95	1
96	1
97	7
98	1
98	5
99	1
99	8
99	10
100	1
102	1
102	8
103	6
104	6
105	1
105	7
106	6
107	8
108	1
108	5
109	1
109	10
110	1
110	9
110	10
111	6
113	1
113	10
114	1
114	9
115	7
115	10
116	1
116	8
117	1
117	8
117	10
118	1
119	9
120	2
121	2
123	2
122	2
124	2
125	2
125	8
126	2
127	6
129	1
129	9
131	4
131	9
131	10
131	5
133	9
134	4
134	10
134	5
135	6
136	4
136	2
137	8
138	2
139	4
139	10
140	2
142	1
142	10
143	1
143	10
144	6
144	1
145	4
145	2
146	7
147	4
148	4
149	6
150	6
150	10
151	4
152	4
152	2
153	1
153	10
155	9
156	2
157	1
157	9
158	5
130	2
160	2
161	2
164	2
165	4
165	2
165	5
166	10
167	2
168	2
168	9
169	1
170	1
170	10
172	1
172	6
173	6
174	6
175	2
176	10
177	1
177	9
178	1
178	2
179	2
180	2
181	8
182	4
182	5
183	1
183	5
184	1
184	7
185	9
186	9
187	1
187	10
188	2
190	1
190	10
191	4
191	2
191	10
192	1
192	4
193	2
195	6
159	1
196	1
197	6
197	1
197	10
198	1
198	10
199	2
200	4
200	5
201	8
202	2
203	2
205	4
205	5
206	7
206	9
206	10
207	1
207	10
208	6
209	9
210	1
210	7
211	1
211	4
211	9
211	10
213	9
214	2
215	1
215	9
216	6
217	1
217	4
218	9
219	1
219	10
220	1
220	9
221	1
221	10
222	3
223	2
224	6
225	2
225	8
225	3
226	1
226	7
227	2
227	8
228	4
228	2
228	8
229	6
230	8
231	1
231	2
232	1
232	2
233	1
233	10
234	9
235	9
235	10
236	2
236	3
237	2
237	3
238	2
238	3
239	3
239	9
240	9
241	9
242	2
242	3
243	2
244	6
245	1
245	10
246	6
247	4
248	2
248	3
249	2
249	3
250	8
251	6
252	1
252	10
253	4
253	3
253	10
254	2
254	3
255	3
256	2
256	3
257	6
258	1
258	9
259	6
260	6
262	2
262	3
263	1
264	2
264	3
265	2
265	3
266	3
267	6
268	6
269	2
269	5
270	6
271	6
272	6
273	6
274	1
274	4
274	9
275	6
276	6
277	6
278	2
278	3
279	2
279	3
280	2
280	3
281	6
282	2
282	3
283	1
283	9
284	3
284	5
285	6
286	6
286	9
287	1
287	10
288	4
288	2
289	6
290	6
290	2
291	6
292	6
292	1
293	6
293	1
294	6
294	9
295	2
295	3
296	2
296	3
297	1
297	2
297	3
298	6
299	1
299	3
299	10
300	9
300	10
301	2
302	2
302	3
303	1
303	10
304	2
304	3
305	1
305	10
306	6
307	2
307	3
308	6
309	6
309	2
310	1
310	10
311	1
312	10
312	5
313	2
313	3
314	3
315	6
315	2
316	1
316	10
317	1
317	8
318	2
318	3
319	6
319	2
320	6
320	2
321	1
321	9
321	10
322	2
322	3
323	6
323	2
324	8
324	3
325	3
326	1
327	9
327	10
328	6
329	6
329	2
331	1
331	9
331	10
332	9
333	7
334	6
334	1
335	6
335	2
335	10
336	6
337	7
337	9
338	1
338	8
339	1
340	6
341	6
342	6
342	2
343	6
344	6
344	1
344	4
344	2
345	1
345	4
345	10
345	5
346	6
347	6
347	2
348	1
349	2
349	3
350	2
350	8
350	3
351	2
351	3
352	6
353	2
353	3
354	1
355	1
356	1
356	2
356	3
357	6
357	2
358	6
359	2
360	1
360	10
361	3
361	10
362	1
363	3
363	9
364	3
365	2
365	3
366	1
367	1
368	1
369	10
370	10
372	10
373	10
374	6
375	10
376	6
377	1
377	10
378	2
378	3
379	6
380	1
381	6
381	2
382	10
383	2
383	3
384	8
385	1
386	9
387	6
387	2
388	2
388	3
389	2
389	3
389	10
390	1
391	6
391	10
392	6
393	6
394	8
395	10
396	1
396	8
397	8
397	3
397	9
398	2
398	3
399	1
399	10
400	6
400	1
401	1
401	8
401	10
402	1
402	10
403	6
405	6
406	1
407	1
408	8
408	9
409	9
409	5
410	1
410	9
410	5
411	1
411	3
411	10
412	1
412	10
412	5
413	9
414	6
415	1
415	10
416	4
416	2
417	8
417	9
417	10
417	5
418	2
418	3
419	6
419	2
419	8
419	10
420	6
420	1
420	4
420	10
421	8
421	9
421	5
422	8
422	9
422	5
423	8
423	9
423	5
424	6
424	2
425	1
425	3
426	2
426	3
426	10
427	9
427	10
427	5
428	1
428	9
428	10
429	1
429	10
430	9
431	3
432	6
432	3
433	6
433	2
434	1
435	1
435	10
435	5
436	1
436	4
436	10
437	4
437	9
438	1
440	9
440	5
441	9
439	6
442	1
442	10
443	9
444	6
444	2
445	6
445	2
445	10
446	1
447	1
447	4
447	10
448	9
448	10
449	4
449	10
449	5
450	9
450	10
451	10
451	5
452	6
453	1
454	9
455	1
455	10
456	8
457	4
457	10
457	5
458	8
458	9
458	10
459	3
460	6
461	3
462	1
462	2
463	3
463	10
464	3
464	10
465	4
465	9
465	5
466	6
467	1
468	9
468	10
469	1
469	10
470	9
470	10
471	5
472	1
473	9
474	1
474	9
475	1
475	9
476	1
476	10
477	9
477	10
479	1
479	9
479	10
478	7
480	3
480	10
481	9
481	12
482	2
482	3
483	8
484	6
484	10
485	1
485	10
486	7
487	2
487	3
488	10
488	5
488	4
489	8
489	9
489	5
490	4
490	10
491	8
491	10
492	6
492	3
492	10
493	6
493	8
494	1
495	1
495	7
496	12
496	10
497	1
498	2
499	6
499	2
500	9
501	1
501	4
501	10
502	1
502	2
502	8
502	3
503	1
503	2
503	8
503	3
504	1
504	2
504	8
504	3
505	9
505	10
506	6
506	1
506	10
507	1
507	9
508	1
508	4
508	10
509	1
509	3
509	10
510	1
510	10
511	2
511	3
511	10
512	6
513	6
514	6
515	7
516	6
517	12
518	2
518	3
518	10
519	12
519	9
519	5
520	8
520	3
520	9
521	8
522	12
523	12
524	6
524	2
525	6
525	2
526	1
526	10
527	12
527	8
527	9
527	5
528	2
528	8
528	3
528	10
529	6
529	2
530	3
530	10
531	1
532	8
532	3
532	10
532	5
533	1
533	10
534	1
534	9
534	10
534	5
535	3
535	10
536	8
536	9
536	5
537	8
537	9
538	6
538	2
539	6
539	3
540	8
540	9
541	6
541	1
541	2
542	1
542	7
542	12
543	6
543	8
543	10
544	6
544	2
544	3
545	10
546	12
547	7
548	6
548	8
549	8
549	9
550	1
550	10
551	6
551	1
551	10
552	1
552	12
553	3
553	10
554	2
554	3
554	10
555	8
555	5
556	1
556	3
556	10
557	6
557	2
557	10
558	6
558	8
559	6
559	8
560	7
561	6
561	2
562	4
562	12
562	8
563	10
564	3
565	4
565	10
565	5
566	7
566	12
567	7
567	12
568	12
569	12
570	7
570	9
570	5
571	1
571	10
572	6
572	2
572	3
573	4
574	8
574	9
575	1
575	5
576	4
576	10
577	4
577	8
578	10
578	5
579	5
580	12
580	5
581	12
581	8
582	2
582	3
583	1
583	10
584	7
584	8
584	9
585	1
585	12
585	10
586	6
586	2
587	6
587	1
587	10
588	1
588	12
589	1
589	4
589	5
590	12
591	12
592	12
592	2
593	1
593	4
593	10
594	12
594	9
595	6
595	2
595	3
596	9
597	4
597	12
597	2
598	12
598	9
598	5
599	12
600	12
601	1
601	2
601	3
602	10
602	5
603	1
603	9
603	10
604	7
605	7
605	12
606	12
607	12
608	12
609	7
609	12
610	6
610	10
611	9
612	7
612	9
613	1
613	10
613	5
614	9
614	5
615	12
616	12
616	9
617	1
617	10
618	2
619	1
619	9
619	10
620	12
620	2
621	12
621	2
622	12
623	12
623	2
624	6
624	1
625	9
626	1
626	4
627	7
628	12
628	10
629	4
629	12
629	2
629	10
630	12
630	2
632	12
631	12
631	2
633	12
634	1
634	10
635	1
635	8
636	12
637	12
638	12
639	4
639	2
640	7
641	7
641	12
642	1
642	10
643	12
643	2
643	8
644	4
644	10
645	12
645	2
646	12
646	2
647	12
647	8
648	12
648	8
649	12
650	1
650	12
651	12
651	10
652	1
652	10
653	12
653	10
654	10
655	8
656	4
657	12
658	1
658	12
659	4
659	10
660	7
660	12
661	12
661	8
662	10
663	12
663	10
664	6
664	2
665	12
665	2
666	12
667	6
667	12
668	7
668	9
669	3
670	1
670	7
670	12
671	12
671	2
672	12
672	2
673	8
674	12
674	2
675	1
675	7
676	12
677	12
678	12
678	2
680	12
681	1
681	12
681	10
682	12
682	8
683	12
683	2
684	1
684	12
684	10
685	12
685	2
686	6
686	12
687	1
687	7
687	12
688	12
688	2
689	12
689	2
690	12
690	2
691	12
691	10
692	1
692	12
692	10
693	12
693	10
694	12
694	2
695	12
695	10
696	12
696	2
697	12
697	2
698	6
698	9
699	4
699	9
700	4
701	12
701	8
702	4
703	4
703	12
704	7
705	12
705	2
706	9
706	5
707	2
707	8
707	12
708	12
708	8
708	10
709	7
709	9
710	1
710	7
710	12
711	7
711	12
711	9
712	7
712	12
712	9
713	7
713	12
713	10
714	6
714	12
714	2
714	3
716	12
716	2
717	7
717	12
718	12
718	2
719	12
720	3
721	1
721	12
721	10
722	12
723	12
723	2
724	7
724	12
725	1
725	12
725	9
726	1
726	12
727	12
728	12
728	2
729	12
730	7
730	12
731	7
731	12
732	7
732	9
733	9
734	12
735	12
736	12
736	9
737	12
738	12
738	2
739	12
740	12
740	9
741	12
741	4
742	12
742	10
743	9
744	1
744	9
745	9
746	4
746	9
746	5
747	12
747	2
748	12
749	12
750	12
751	1
751	10
752	12
753	12
754	12
754	8
755	12
755	10
756	12
757	12
757	9
758	12
758	9
759	12
759	9
760	12
760	10
761	12
761	2
762	7
762	12
763	12
763	2
764	12
765	12
765	8
766	12
766	8
767	12
767	8
768	12
768	8
769	12
770	12
771	12
772	12
772	2
773	7
773	12
774	12
774	2
775	7
775	12
776	4
776	2
776	3
777	12
778	12
778	10
779	12
780	12
780	10
781	12
782	12
783	12
784	12
785	4
785	9
786	7
786	12
786	9
787	3
787	10
788	7
788	2
789	1
789	10
790	4
790	3
791	12
792	12
793	12
794	1
794	4
794	10
795	7
795	12
795	10
796	7
796	12
797	7
797	12
798	12
799	7
799	12
800	12
800	10
801	12
801	2
802	2
802	3
803	2
803	3
804	12
804	10
805	7
805	12
806	12
807	7
807	12
807	10
808	12
809	9
810	4
811	12
812	12
812	10
813	12
814	12
814	2
815	12
816	1
816	3
816	10
817	7
817	12
817	10
819	6
819	12
820	12
821	12
822	12
823	12
824	12
825	12
826	3
827	12
828	12
829	12
830	12
831	7
831	12
831	9
832	4
832	12
833	4
833	12
834	12
834	2
835	12
835	2
836	7
836	12
837	3
838	4
838	12
839	12
840	1
840	12
841	1
841	12
842	12
842	10
843	12
843	10
844	12
845	4
845	12
846	4
847	7
847	12
847	10
848	12
848	3
848	10
849	3
850	1
850	4
851	12
851	10
852	8
853	12
854	12
854	3
854	10
856	3
856	4
855	7
855	12
188	3
189	2
189	3
302	6
613	4
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: action
--

COPY schema_migrations (version) FROM stdin;
20140210193621
20140210194914
20140211141945
20140705055628
20140714023545
20140724180704
20140730174716
20140731035952
20140802051332
20141004190229
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: action
--

COPY topics (id, "topicName", comments, created_at, updated_at) FROM stdin;
2	Graphing		2014-02-20 17:10:37.16577	2014-02-20 17:10:37.16577
3	Linear Algebra		2014-02-20 17:27:26.180291	2014-02-20 17:27:26.180291
5	Unit Conversion		2014-07-07 05:55:04.856829	2014-07-11 17:12:15.458177
4	Distance, Rate, Time	And similar	2014-07-07 05:52:57.378728	2014-07-11 19:12:52.415076
8	Guess/Check/Estimate		2014-07-11 21:11:06.222847	2014-07-11 21:11:06.222847
9	Skills Practice		2014-07-11 21:30:05.970544	2014-07-11 21:30:05.970544
10	Solving Equations		2014-07-11 21:41:45.009242	2014-07-11 21:41:45.009242
1	Algebraic Representation	Very important all year	2014-02-14 23:00:25.509033	2014-07-12 06:00:39.601118
6	Abs Val/Num Line/Inequalities	Et al.	2014-07-11 17:57:27.350734	2014-08-01 03:27:28.025743
7	Distributive Prop./Factoring		2014-07-11 17:57:58.193144	2014-08-09 18:42:38.985867
12	Exponents/Quadratics		2014-08-09 15:26:42.096065	2014-08-15 04:28:47.525147
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('topics_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: action
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin, teacher, viewer) FROM stdin;
2	elindow@verizon.net	$2a$10$JVA9Tci7mX49kB7z6lnUseu/K.pK79nuY8l/DqFZylhLifcTmXF46	\N	\N	2014-10-16 13:10:25.971334	18	2014-10-16 13:10:26.121871	2014-09-30 19:08:49.308592	69.38.231.2	69.38.231.2	2014-07-30 18:03:05.906702	2014-10-16 13:10:26.12386	t	f	f
1	elindow@trevor.org	$2a$10$6kKYnytON0Mu2JR/feMUUObahzdJ7s555dKcgAuX20sntxRqjW9qC	bdd1bbe5989cbfd87e71d143d9fab5689d974ddba46adef1294f5c213ffcd5b8	2014-08-18 14:12:59.538057	2014-08-03 21:29:29.520577	20	2014-08-03 21:29:29.527771	2014-08-03 17:01:19.700415	74.101.159.88	74.101.159.88	2014-07-24 19:49:15.7088	2014-08-18 14:12:59.539006	t	f	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: action
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: action; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: action; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: action
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM action;
GRANT ALL ON SCHEMA public TO action;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

