defmodule AshUnionIssueWeb.Resources.Children do
  use Ash.Type.NewType, subtype_of: :union, constraints: [types: [
    one_of_the_children: [type: AshUnionIssueWeb.Resources.OneOfTheChildren, tag: :type, tag_value: "one_of_the_children", cast_tag?: false],
  ]]
end
