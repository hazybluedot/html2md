Feature: Markdown
  We need to convert basic HTML to markdown

  Scenario: Create a H Rule (HR) element
    * HTML <hr/>
    * I say parse
    * The markdown should be (\n* * * * *\n)

  Scenario: Create a hard break (BR) element
    * HTML <br/>
    * I say parse
    * The markdown should be (  \n)

  Scenario: Paragraph (P) elements should be a single hard return
    * HTML <p>
    * I say parse
    * The markdown should be (\n\n)

  Scenario: Link (a href=) elements should should convert
    * HTML <a href="/some/link.html"> Link </a>
    * I say parse
    * The markdown should be ([ Link ](/some/link.html))

  Scenario: Other (a) elements should be ignored
    * HTML <a> Text </a>
    * I say parse
    * The markdown should be ( Text ) 

  Scenario: An order list
    * HTML <ol><li>First</li><li>Second</li><ol>
    * I say parse
    * The markdown should be (\n  1. First\n  2. Second\n\n)

  Scenario: An un-order list
    * HTML <ul><li>First</li><li>Second</li><ul>
    * I say parse
    * The markdown should be (\n  - First\n  - Second\n\n) 

  Scenario: Complex List
    * HTML <ul><li>First</li><li> <ol><li>First<ul><li>First</li><li>Second</li></ul></li><li>Second</li> </ol>Second</li><ul>
    * I say parse
    * The markdown should be (\n  - First\n  - \n    1. First\n      - First\n      - Second\n\n    2. Second\nSecond\n\n)

  Scenario: Emphasis (em) element
    * HTML <em>Emphasis</em>
    * I say parse
    * The markdown should be (_Emphasis_)

  Scenario: Strong (strong) element
    * HTML <strong>Emphasis</strong>
    * I say parse
    * The markdown should be (**Emphasis**)

  Scenario: Pre (pre) element
    * HTML <pre>This is some preformatted code</pre>
    * I say parse
    * The markdown should be (\n```\nThis is some preformatted code\n```\n) 

  Scenario: Other HTML Elements (div) should be ignored
    * HTML <div>This is in a div</div>
    * I say parse
    * The markdown should be (This is in a div)

  Scenario: Other HTML Elements (span) should be ignored  
    * HTML <span>This is in a span</span>
    * I say parse
    * The markdown should be (This is in a span) 

  Scenario: Character data should not have new lines  
    * HTML This is character data \n
    * I say parse
    * The markdown should be (This is character data \n\n)     
