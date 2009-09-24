require 'test/unit'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../examples'
require 'simple'
require 'complex'
require 'escaped'
require 'unescaped'

class RTemplateTest < Test::Unit::TestCase
  def test_complex
    assert_equal <<-end_complex, Complex.to_html
<h1>Colors</h1>
<ul>
  <li><strong>red</strong></li>
    <li><a href="#Green">green</a></li>
    <li><a href="#Blue">blue</a></li>
    </ul>
end_complex
  end

  def test_simple
    assert_equal <<-end_simple, Simple.to_html
Hello Chris
You have just won $10000!
Well, $6000.0, after taxes.
end_simple
  end

  def test_escaped
    assert_equal '<h1>Bear &gt; Shark</h1>', Escaped.to_html
  end

  def test_unescaped
    assert_equal '<h1>Bear > Shark</h1>', Unescaped.to_html
  end
end