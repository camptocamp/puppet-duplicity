require 'spec_helper'

describe 'duplicity' do
  let(:facts) {{
    :operatingsystem => 'Debian',
  }}
  it { should compile.with_all_deps }
end
