
# Wagon

Wagon is a minimalist bundler for Lua rocks. It makes LuaRocks install them
into a project's local rocktree directory, and sets up your environment so that
Lua applications become aware of the those installed rocks. It works only with
bash.

## Similar projects

+ [Moonbox](https://github.com/kernelp4nic/moonbox), which is better written
  and more feature-comprehensive. The only cons are that it does not support
  Lua >= 5.3 and that it uses its own file format for bundling (whereas
  Wagon relies on the community-wide luarocks spec format).

