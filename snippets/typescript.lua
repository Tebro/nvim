return {
	s("comp", fmt([[
type {}Props = {{
	{}
}};

const {}: React.FC<{}Props> = ({}) => {{
	{}
}};
]], { i(1), i(2), rep(1), rep(1), i(3), i(4) })),
	s("fn", fmt("const {} = ({}) => {{{}}};", { i(1), i(2), i(3) })),
	s("zobj", fmt([[
const {} = zod.object({{
  {}
}});

type {} = zod.infer<typeof {}>;
]], { i(1), i(2), i(3), rep(1) })),
}
