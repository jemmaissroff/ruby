# frozen_string_literal: false
require 'test/unit'
require '-test-/marshal/internal_ivar'

module Bug end

module Bug::Marshal
  class TestInternalIVar < Test::Unit::TestCase
    class InternalIV2 < InternalIVar ; end

    def test_internal_ivar_dup
      v = InternalIV2.new("hello", "world", "bye")
      m = v.dup

      assert_equal(v.instance_variables, [])
      assert_equal(m.instance_variables, [])

      assert_equal("hello", m.normal)
      assert_equal("world", m.internal)
      assert_equal("bye", m.encoding_short)
    end

    def test_marshal
      v = InternalIVar.new("hello", "world", "bye")
      assert_equal("hello", v.normal)
      assert_equal("world", v.internal)
      assert_equal("bye", v.encoding_short)
      dump = assert_warn(/instance variable `E' on class \S+ is not dumped/) {
        ::Marshal.dump(v)
      }
      v = assert_nothing_raised {break ::Marshal.load(dump)}
      assert_instance_of(InternalIVar, v)
      assert_equal("hello", v.normal)
      assert_nil(v.internal)
      assert_nil(v.encoding_short)
    end
  end
end
