require "./lib_erl_nif"

def func(name, arity, &block : LibErlNif::Nifenv, LibC::Int, LibErlNif::Term* -> LibErlNif::Term)
  LibErlNif::FuncT.new(
    name: name,
    arity: arity,
    fptr: block
  )
end

fun nif_init : LibErlNif::EntryT*
  GC.init
  # TODO segfaults after this call?
  # LibCrystalMain.__crystal_main(0, nil)

  hello_func = func("from_crystal", 0) do |env, argc, argv|
    string = "Hi from Crystal"
    LibErlNif.make_string(env, string, LibErlNif::Nifcharencoding::Latin1)
  end

   echo_func = func("echo", 1) do |env, argc, argv|
     argv[0]
   end

  funcs = [
    hello_func,
    echo_func
  ]

  load = ->(env : LibErlNif::Nifenv, priv_data : Void**, load_info : LibErlNif::Term) { 0 }
  reload = ->(env : LibErlNif::Nifenv, priv_data : Void**, load_info : LibErlNif::Term) { 0 }
  upgrade = ->(env : LibErlNif::Nifenv, priv_data : Void**, old_priv_data : Void**, load_info : LibErlNif::Term) { 0 }
  unload = ->(env : LibErlNif::Nifenv, priv_data : Void*) {}

  entry = LibErlNif::EntryT.new(
    major: LibErlNif::MAJOR_VERSION,
    minor: LibErlNif::MINOR_VERSION,
    name: "Elixir.HelloWorld",
    num_of_funcs: funcs.size,
    funcs: funcs,
    load: load,
    reload: reload,
    upgrade: upgrade,
    unload: unload,
    vm_variant: "beam.vanilla",
    options: LibErlNif::DIRTY_NIF_OPTION
  )

  pointerof(entry)
end
