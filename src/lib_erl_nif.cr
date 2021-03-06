lib LibErlNif
  MAJOR_VERSION = 2
  MINOR_VERSION = 11
  MIN_REQUIRED_MAJOR_VERSION_ON_LOAD = 2
  DIRTY_NIF_OPTION = 1
  THR_UNDEFINED = 0
  THR_NORMAL_SCHEDULER = 1
  THR_DIRTY_CPU_SCHEDULER = 2
  THR_DIRTY_IO_SCHEDULER = 3
  Sec = 0
  Msec = 1
  Usec = 2
  Nsec = 3
  alias EnvironmentT = Void
  struct FuncT
    name : LibC::Char*
    arity : LibC::UInt
    fptr : (Nifenv, LibC::Int, Term* -> Term)
    flags : LibC::UInt
  end
  type Nifenv = Void*
  alias Napiuint64 = LibC::ULong
  alias Napiuint = Napiuint64
  alias Nifuint = Napiuint
  alias Term = Nifuint
  struct EntryT
    major : LibC::Int
    minor : LibC::Int
    name : LibC::Char*
    num_of_funcs : LibC::Int
    funcs : FuncT*
    load : (Nifenv, Void**, Term -> LibC::Int)
    reload : (Nifenv, Void**, Term -> LibC::Int)
    upgrade : (Nifenv, Void**, Void**, Term -> LibC::Int)
    unload : (Nifenv, Void* -> Void)
    vm_variant : LibC::Char*
    options : LibC::UInt
  end
  type Niffunc = FuncT
  alias ResourceTypeT = Void
  RtCreate = 1
  RtTakeover = 2
  Latin1 = 1
  alias Drvtid = Void
  alias Drvmutex = Void
  alias Drvcond = Void
  alias Drvrwlock = Void
  DirtyJobCpuBound = 1
  DirtyJobIoBound = 2
  MapIteratorFirst = 1
  MapIteratorLast = 2
  MapIteratorHead = 1
  MapIteratorTail = 2
  UniquePositive = 1
  UniqueMonotonic = 2
  Bin2termSafe = 536870912
  fun priv_data = enif_priv_data(x0 : Nifenv) : Void*
  fun alloc = enif_alloc(size : LibC::SizeT) : Void*
  fun free = enif_free(ptr : Void*)
  fun is_atom = enif_is_atom(x0 : Nifenv, term : Term) : LibC::Int
  fun is_binary = enif_is_binary(x0 : Nifenv, term : Term) : LibC::Int
  fun is_ref = enif_is_ref(x0 : Nifenv, term : Term) : LibC::Int
  fun inspect_binary = enif_inspect_binary(x0 : Nifenv, bin_term : Term, bin : Nifbinary*) : LibC::Int
  struct Nifbinary
    size : LibC::SizeT
    data : UInt8*
    bin_term : Term
    ref_bin : Void*
  end
  fun alloc_binary = enif_alloc_binary(size : LibC::SizeT, bin : Nifbinary*) : LibC::Int
  fun realloc_binary = enif_realloc_binary(bin : Nifbinary*, size : LibC::SizeT) : LibC::Int
  fun release_binary = enif_release_binary(bin : Nifbinary*)
  fun get_int = enif_get_int(x0 : Nifenv, term : Term, ip : LibC::Int*) : LibC::Int
  fun get_ulong = enif_get_ulong(x0 : Nifenv, term : Term, ip : LibC::ULong*) : LibC::Int
  fun get_double = enif_get_double(x0 : Nifenv, term : Term, dp : LibC::Double*) : LibC::Int
  fun get_list_cell = enif_get_list_cell(env : Nifenv, term : Term, head : Term*, tail : Term*) : LibC::Int
  fun get_tuple = enif_get_tuple(env : Nifenv, tpl : Term, arity : LibC::Int*, array : Term**) : LibC::Int
  fun is_identical = enif_is_identical(lhs : Term, rhs : Term) : LibC::Int
  fun compare = enif_compare(lhs : Term, rhs : Term) : LibC::Int
  fun make_binary = enif_make_binary(env : Nifenv, bin : Nifbinary*) : Term
  fun make_badarg = enif_make_badarg(env : Nifenv) : Term
  fun make_int = enif_make_int(env : Nifenv, i : LibC::Int) : Term
  fun make_ulong = enif_make_ulong(env : Nifenv, i : LibC::ULong) : Term
  fun make_double = enif_make_double(env : Nifenv, d : LibC::Double) : Term
  fun make_atom = enif_make_atom(env : Nifenv, name : LibC::Char*) : Term
  fun make_existing_atom = enif_make_existing_atom(env : Nifenv, name : LibC::Char*, atom : Term*, x3 : Nifcharencoding) : LibC::Int
  enum Nifcharencoding
    Latin1 = 1
  end
  fun make_tuple = enif_make_tuple(env : Nifenv, cnt : LibC::UInt, ...) : Term
  fun make_list = enif_make_list(env : Nifenv, cnt : LibC::UInt, ...) : Term
  fun make_list_cell = enif_make_list_cell(env : Nifenv, car : Term, cdr : Term) : Term
  fun make_string = enif_make_string(env : Nifenv, string : LibC::Char*, x2 : Nifcharencoding) : Term
  fun make_ref = enif_make_ref(env : Nifenv) : Term
  fun mutex_create = enif_mutex_create(name : LibC::Char*) : Nifmutex
  type Nifmutex = Void*
  fun mutex_destroy = enif_mutex_destroy(mtx : Nifmutex)
  fun mutex_trylock = enif_mutex_trylock(mtx : Nifmutex) : LibC::Int
  fun mutex_lock = enif_mutex_lock(mtx : Nifmutex)
  fun mutex_unlock = enif_mutex_unlock(mtx : Nifmutex)
  fun cond_create = enif_cond_create(name : LibC::Char*) : Nifcond
  type Nifcond = Void*
  fun cond_destroy = enif_cond_destroy(cnd : Nifcond)
  fun cond_signal = enif_cond_signal(cnd : Nifcond)
  fun cond_broadcast = enif_cond_broadcast(cnd : Nifcond)
  fun cond_wait = enif_cond_wait(cnd : Nifcond, mtx : Nifmutex)
  fun rwlock_create = enif_rwlock_create(name : LibC::Char*) : Nifrwlock
  type Nifrwlock = Void*
  fun rwlock_destroy = enif_rwlock_destroy(rwlck : Nifrwlock)
  fun rwlock_tryrlock = enif_rwlock_tryrlock(rwlck : Nifrwlock) : LibC::Int
  fun rwlock_rlock = enif_rwlock_rlock(rwlck : Nifrwlock)
  fun rwlock_runlock = enif_rwlock_runlock(rwlck : Nifrwlock)
  fun rwlock_tryrwlock = enif_rwlock_tryrwlock(rwlck : Nifrwlock) : LibC::Int
  fun rwlock_rwlock = enif_rwlock_rwlock(rwlck : Nifrwlock)
  fun rwlock_rwunlock = enif_rwlock_rwunlock(rwlck : Nifrwlock)
  fun tsd_key_create = enif_tsd_key_create(name : LibC::Char*, key : Niftsdkey*) : LibC::Int
  alias Niftsdkey = LibC::Int
  fun tsd_key_destroy = enif_tsd_key_destroy(key : Niftsdkey)
  fun tsd_set = enif_tsd_set(key : Niftsdkey, data : Void*)
  fun tsd_get = enif_tsd_get(key : Niftsdkey) : Void*
  fun thread_opts_create = enif_thread_opts_create(name : LibC::Char*) : Nifthreadopts*
  struct Drvthreadopts
    suggested_stack_size : LibC::Int
  end
  alias Nifthreadopts = Drvthreadopts
  fun thread_opts_destroy = enif_thread_opts_destroy(opts : Nifthreadopts*)
  fun thread_create = enif_thread_create(name : LibC::Char*, tid : Niftid*, func : (Void* -> Void*), args : Void*, opts : Nifthreadopts*) : LibC::Int
  type Niftid = Void*
  fun thread_self = enif_thread_self : Niftid
  fun equal_tids = enif_equal_tids(tid1 : Niftid, tid2 : Niftid) : LibC::Int
  fun thread_exit = enif_thread_exit(resp : Void*)
  fun thread_join = enif_thread_join(x0 : Niftid, respp : Void**) : LibC::Int
  fun realloc = enif_realloc(ptr : Void*, size : LibC::SizeT) : Void*
  fun system_info = enif_system_info(sip : Nifsysinfo*, si_size : LibC::SizeT)
  struct Drvsysinfo
    driver_major_version : LibC::Int
    driver_minor_version : LibC::Int
    erts_version : LibC::Char*
    otp_release : LibC::Char*
    thread_support : LibC::Int
    smp_support : LibC::Int
    async_threads : LibC::Int
    scheduler_threads : LibC::Int
    nif_major_version : LibC::Int
    nif_minor_version : LibC::Int
    dirty_scheduler_support : LibC::Int
  end
  alias Nifsysinfo = Drvsysinfo
  fun fprintf = enif_fprintf(filep : Void*, format : LibC::Char*, ...) : LibC::Int
  fun inspect_iolist_as_binary = enif_inspect_iolist_as_binary(x0 : Nifenv, term : Term, bin : Nifbinary*) : LibC::Int
  fun make_sub_binary = enif_make_sub_binary(x0 : Nifenv, bin_term : Term, pos : LibC::SizeT, size : LibC::SizeT) : Term
  fun get_string = enif_get_string(x0 : Nifenv, list : Term, buf : LibC::Char*, len : LibC::UInt, x4 : Nifcharencoding) : LibC::Int
  fun get_atom = enif_get_atom(x0 : Nifenv, atom : Term, buf : LibC::Char*, len : LibC::UInt, x4 : Nifcharencoding) : LibC::Int
  fun is_fun = enif_is_fun(x0 : Nifenv, term : Term) : LibC::Int
  fun is_pid = enif_is_pid(x0 : Nifenv, term : Term) : LibC::Int
  fun is_port = enif_is_port(x0 : Nifenv, term : Term) : LibC::Int
  fun get_uint = enif_get_uint(x0 : Nifenv, term : Term, ip : LibC::UInt*) : LibC::Int
  fun get_long = enif_get_long(x0 : Nifenv, term : Term, ip : LibC::Long*) : LibC::Int
  fun make_uint = enif_make_uint(x0 : Nifenv, i : LibC::UInt) : Term
  fun make_long = enif_make_long(x0 : Nifenv, i : LibC::Long) : Term
  fun make_tuple_from_array = enif_make_tuple_from_array(x0 : Nifenv, arr : Term*, cnt : LibC::UInt) : Term
  fun make_list_from_array = enif_make_list_from_array(x0 : Nifenv, arr : Term*, cnt : LibC::UInt) : Term
  fun is_empty_list = enif_is_empty_list(x0 : Nifenv, term : Term) : LibC::Int
  fun open_resource_type = enif_open_resource_type(x0 : Nifenv, module_str : LibC::Char*, name_str : LibC::Char*, dtor : (Nifenv, Void* -> Void), flags : Nifresourceflags, tried : Nifresourceflags*) : Nifresourcetype
  enum Nifresourceflags
    RtCreate = 1
    RtTakeover = 2
  end
  type Nifresourcetype = Void*
  fun alloc_resource = enif_alloc_resource(type : Nifresourcetype, size : LibC::SizeT) : Void*
  fun release_resource = enif_release_resource(obj : Void*)
  fun make_resource = enif_make_resource(x0 : Nifenv, obj : Void*) : Term
  fun get_resource = enif_get_resource(x0 : Nifenv, term : Term, type : Nifresourcetype, objp : Void**) : LibC::Int
  fun sizeof_resource = enif_sizeof_resource(obj : Void*) : LibC::SizeT
  fun make_new_binary = enif_make_new_binary(x0 : Nifenv, size : LibC::SizeT, termp : Term*) : UInt8*
  fun is_list = enif_is_list(x0 : Nifenv, term : Term) : LibC::Int
  fun is_tuple = enif_is_tuple(x0 : Nifenv, term : Term) : LibC::Int
  fun get_atom_length = enif_get_atom_length(x0 : Nifenv, atom : Term, len : LibC::UInt*, x3 : Nifcharencoding) : LibC::Int
  fun get_list_length = enif_get_list_length(env : Nifenv, term : Term, len : LibC::UInt*) : LibC::Int
  fun make_atom_len = enif_make_atom_len(env : Nifenv, name : LibC::Char*, len : LibC::SizeT) : Term
  fun make_existing_atom_len = enif_make_existing_atom_len(env : Nifenv, name : LibC::Char*, len : LibC::SizeT, atom : Term*, x4 : Nifcharencoding) : LibC::Int
  fun make_string_len = enif_make_string_len(env : Nifenv, string : LibC::Char*, len : LibC::SizeT, x3 : Nifcharencoding) : Term
  fun alloc_env = enif_alloc_env : Nifenv
  fun free_env = enif_free_env(env : Nifenv)
  fun clear_env = enif_clear_env(env : Nifenv)
  fun send = enif_send(env : Nifenv, to_pid : Nifpid*, msg_env : Nifenv, msg : Term) : LibC::Int
  struct Nifpid
    pid : Term
  end
  fun make_copy = enif_make_copy(dst_env : Nifenv, src_term : Term) : Term
  fun self = enif_self(caller_env : Nifenv, pid : Nifpid*) : Nifpid*
  fun get_local_pid = enif_get_local_pid(env : Nifenv, x1 : Term, pid : Nifpid*) : LibC::Int
  fun keep_resource = enif_keep_resource(obj : Void*)
  fun make_resource_binary = enif_make_resource_binary(x0 : Nifenv, obj : Void*, data : Void*, size : LibC::SizeT) : Term
  fun is_exception = enif_is_exception(x0 : Nifenv, term : Term) : LibC::Int
  fun make_reverse_list = enif_make_reverse_list(x0 : Nifenv, term : Term, list : Term*) : LibC::Int
  fun is_number = enif_is_number(x0 : Nifenv, term : Term) : LibC::Int
  fun dlopen = enif_dlopen(lib : LibC::Char*, err_handler : (Void*, LibC::Char* -> Void), err_arg : Void*) : Void*
  fun dlsym = enif_dlsym(handle : Void*, symbol : LibC::Char*, err_handler : (Void*, LibC::Char* -> Void), err_arg : Void*) : Void*
  fun consume_timeslice = enif_consume_timeslice(x0 : Nifenv, percent : LibC::Int) : LibC::Int
  fun is_map = enif_is_map(env : Nifenv, term : Term) : LibC::Int
  fun get_map_size = enif_get_map_size(env : Nifenv, term : Term, size : LibC::SizeT*) : LibC::Int
  fun make_new_map = enif_make_new_map(env : Nifenv) : Term
  fun make_map_put = enif_make_map_put(env : Nifenv, map_in : Term, key : Term, value : Term, map_out : Term*) : LibC::Int
  fun get_map_value = enif_get_map_value(env : Nifenv, map : Term, key : Term, value : Term*) : LibC::Int
  fun make_map_update = enif_make_map_update(env : Nifenv, map_in : Term, key : Term, value : Term, map_out : Term*) : LibC::Int
  fun make_map_remove = enif_make_map_remove(env : Nifenv, map_in : Term, key : Term, map_out : Term*) : LibC::Int
  fun map_iterator_create = enif_map_iterator_create(env : Nifenv, map : Term, iter : Nifmapiterator*, entry : Nifmapiteratorentry) : LibC::Int
  struct Nifmapiterator
    map : Term
    size : Uint
    idx : Uint
    u : NifmapiteratorU
    __spare__ : Void*[2]
  end
  alias Uint = Term
  union NifmapiteratorU
    flat : NifmapiteratorUFlat
    hash : NifmapiteratorUHash
  end
  struct NifmapiteratorUFlat
    ks : Term*
    vs : Term*
  end
  struct NifmapiteratorUHash
    wstack : Void*
    kv : Term*
  end
  enum Nifmapiteratorentry
    MapIteratorFirst = 1
    MapIteratorLast = 2
    MapIteratorHead = 1
    MapIteratorTail = 2
  end
  fun map_iterator_destroy = enif_map_iterator_destroy(env : Nifenv, iter : Nifmapiterator*)
  fun map_iterator_is_head = enif_map_iterator_is_head(env : Nifenv, iter : Nifmapiterator*) : LibC::Int
  fun map_iterator_is_tail = enif_map_iterator_is_tail(env : Nifenv, iter : Nifmapiterator*) : LibC::Int
  fun map_iterator_next = enif_map_iterator_next(env : Nifenv, iter : Nifmapiterator*) : LibC::Int
  fun map_iterator_prev = enif_map_iterator_prev(env : Nifenv, iter : Nifmapiterator*) : LibC::Int
  fun map_iterator_get_pair = enif_map_iterator_get_pair(env : Nifenv, iter : Nifmapiterator*, key : Term*, value : Term*) : LibC::Int
  fun schedule_nif = enif_schedule_nif(x0 : Nifenv, x1 : LibC::Char*, x2 : LibC::Int, x3 : (Nifenv, LibC::Int, Term* -> Term), x4 : LibC::Int, x5 : Term*) : Term
  fun has_pending_exception = enif_has_pending_exception(env : Nifenv, reason : Term*) : LibC::Int
  fun raise_exception = enif_raise_exception(env : Nifenv, reason : Term) : Term
  fun getenv = enif_getenv(key : LibC::Char*, value : LibC::Char*, value_size : LibC::SizeT*) : LibC::Int
  fun monotonic_time = enif_monotonic_time(x0 : Niftimeunit) : Niftime
  enum Niftimeunit
    Sec = 0
    Msec = 1
    Usec = 2
    Nsec = 3
  end
  alias Napisint64 = LibC::Long
  alias Nifsint64 = Napisint64
  alias Niftime = Nifsint64
  fun time_offset = enif_time_offset(x0 : Niftimeunit) : Niftime
  fun convert_time_unit = enif_convert_time_unit(x0 : Niftime, x1 : Niftimeunit, x2 : Niftimeunit) : Niftime
  fun now_time = enif_now_time(env : Nifenv) : Term
  fun cpu_time = enif_cpu_time(env : Nifenv) : Term
  fun make_unique_integer = enif_make_unique_integer(env : Nifenv, properties : Nifuniqueinteger) : Term
  enum Nifuniqueinteger
    UniquePositive = 1
    UniqueMonotonic = 2
  end
  fun is_current_process_alive = enif_is_current_process_alive(env : Nifenv) : LibC::Int
  fun is_process_alive = enif_is_process_alive(env : Nifenv, pid : Nifpid*) : LibC::Int
  fun is_port_alive = enif_is_port_alive(env : Nifenv, port_id : Nifport*) : LibC::Int
  struct Nifport
    port_id : Term
  end
  fun get_local_port = enif_get_local_port(env : Nifenv, x1 : Term, port_id : Nifport*) : LibC::Int
  fun term_to_binary = enif_term_to_binary(env : Nifenv, term : Term, bin : Nifbinary*) : LibC::Int
  fun binary_to_term = enif_binary_to_term(env : Nifenv, data : UInt8*, sz : LibC::SizeT, term : Term*, opts : LibC::UInt) : LibC::SizeT
  fun port_command = enif_port_command(env : Nifenv, to_port : Nifport*, msg_env : Nifenv, msg : Term) : LibC::Int
  fun thread_type = enif_thread_type : LibC::Int
  fun snprintf = enif_snprintf(buffer : LibC::Char*, size : LibC::SizeT, format : LibC::Char*, ...) : LibC::Int
  fun make_tuple1 = enif_make_tuple1(env : Nifenv, e1 : Term) : Term
  fun make_tuple2 = enif_make_tuple2(env : Nifenv, e1 : Term, e2 : Term) : Term
  fun make_tuple3 = enif_make_tuple3(env : Nifenv, e1 : Term, e2 : Term, e3 : Term) : Term
  fun make_tuple4 = enif_make_tuple4(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term) : Term
  fun make_tuple5 = enif_make_tuple5(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term) : Term
  fun make_tuple6 = enif_make_tuple6(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term) : Term
  fun make_tuple7 = enif_make_tuple7(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term) : Term
  fun make_tuple8 = enif_make_tuple8(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term, e8 : Term) : Term
  fun make_tuple9 = enif_make_tuple9(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term, e8 : Term, e9 : Term) : Term
  fun make_list1 = enif_make_list1(env : Nifenv, e1 : Term) : Term
  fun make_list2 = enif_make_list2(env : Nifenv, e1 : Term, e2 : Term) : Term
  fun make_list3 = enif_make_list3(env : Nifenv, e1 : Term, e2 : Term, e3 : Term) : Term
  fun make_list4 = enif_make_list4(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term) : Term
  fun make_list5 = enif_make_list5(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term) : Term
  fun make_list6 = enif_make_list6(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term) : Term
  fun make_list7 = enif_make_list7(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term) : Term
  fun make_list8 = enif_make_list8(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term, e8 : Term) : Term
  fun make_list9 = enif_make_list9(env : Nifenv, e1 : Term, e2 : Term, e3 : Term, e4 : Term, e5 : Term, e6 : Term, e7 : Term, e8 : Term, e9 : Term) : Term
end

