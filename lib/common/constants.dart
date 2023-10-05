const String appTitle = 'LaTeX & CKEditor Reader';
const String inputHint = 'Enter your raw text here..., or import a text file!';
const String outputHint = 'Output is shown here...';
const String clearTooltip = 'Clear the text';
const String aboutTooltip = 'About the app';
const String fabLabel = 'Import file';
const String outputLoadingLabel = 'Parsing...';
const String aboutPageTitle = 'About the app';
const String aboutContent =
    'This app can parse CKEditor generated text along with LaTeX equations.\nThe user can type the raw text right into the app or import the text from a text file with .txt and .docx extensions.';
const String aboutContentTitle = '\n\nExamine with the following text';
const String exampleText = r'''
<p>
    Read the following <span style="color:#1e88e5;"><strong>questions </strong></span><span style="background-color:#ffd54f;">carefully</span>, and write the <i><u>answers </u></i>on your answer paper.&nbsp;
</p>
<p>
    &nbsp;
</p>
<p>
    <strong>Question #1</strong>
</p>
<p>
    What are the solutions to the quadratic equation (ax<sup>2</sup>+bx+c = 0) for the x variable?
</p>
<p>
    &nbsp;
</p>
<p>
    <strong>Question #2</strong>
</p>
<p>Prove that: $$\sqrt\frac{\sec P + 1}{\sec P - 1} = \text{cosec} P + cotP$$</p>''';
const String clipboardSnackbarMessage = "Text copied to clipboard";
const String clipboardTooltip = 'Copy text';