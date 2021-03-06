abstract LLVMOpaquePtr

for ty in [:ModulePtr, :TypePtr, :ValuePtr, :BasicBlockPtr, :BuilderPtr, 
           :MemoryBufferPtr, :PassManagerPtr, :PassRegistryPtr, :UsePtr]
    @eval begin
        immutable $ty <: LLVMOpaquePtr
            ptr::Ptr{Void}
        end

        pointer(ptr::$ty) = ptr.ptr
        convert(::Type{Ptr{Void}}, ptr::$ty) = pointer(ptr)
    end
end

baremodule AttributeEnum
    z_ext_attribute = 1
    s_ext_attribute = 2
    no_return_attribute = 4
    in_reg_attribute = 8
    struct_ret_attribute = 16
    no_unwind_attribute = 32
    no_alias_attribute = 64
    by_val_attribute = 128
    nest_attribute = 256
    read_none_attribute = 512
    read_only_attribute = 1024
    no_inline_attribute = 2048
    always_inline_attribute = 4096
    optimize_for_size_attribute = 8192
    stack_protect_attribute = 16384
    stack_protect_req_attribute = 32768
    alignment = 2031616
    no_capture_attribute = 2097152
    no_red_zone_attribute = 4194304
    no_implicit_float_attribute = 8388608
    naked_attribute = 16777216
    inline_hint_attribute = 33554432
    stack_alignment = 469762048
    returns_twice = 536870912
    uw_table = 1073741824
end

baremodule TypeKindEnum
    void      = 0   # type with no size
    half      = 1   # 16 bit floating point type
    float     = 2   # 32 bit floating point type
    double    = 3   # 64 bit floating point type
    x86_fp80  = 4   # 80 bit floating point type 
    fp128     = 5   # 128 bit floating point type (112-bit mantissa)
    ppc_fp128 = 6   # 128 bit floating point type (two 64 bits)
    label     = 7   # labels
    integer   = 8   # arbitrary bit width integers
    function_ = 9   # functions
    struct    = 10  # structures
    array     = 11  # arrays
    pointer   = 12  # pointers
    vector    = 13  # SIMD packed format or other vector type
    metadata  = 14  # metadata
    x86_mmx   = 15  # x86 specific multimedia SIMD types 
end

baremodule OpcodeEnum 
    ret = 1
    br = 2
    switch = 3
    indirect_br = 4
    invoke = 5
    unreachable = 7
    add = 8
    f_add = 9
    sub = 10
    f_sub = 11
    mul = 12
    f_mul = 13
    u_div = 14
    s_div = 15
    f_div = 16
    u_rem = 17
    s_rem = 18
    f_rem = 19
    shl = 20
    l_shr = 21
    a_shr = 22
    and = 23
    or = 24
    xor = 25
    alloca = 26
    load  = 27
    store = 28
    get_element_ptr = 29
    trunc = 30
    z_ext = 31
    s_ext = 32
    fp_to_ui = 33
    fp_to_si = 34
    ui_to_fp = 35
    si_to_fp = 36
    fp_trunc = 37
    fp_ext = 38
    ptr_to_int = 39
    int_to_ptr = 40
    bit_cast = 41
    addr_space_cast = 60
    i_cmp = 42
    f_cmp = 43
    phi = 44
    call = 45
    select = 46
    user_op1 = 47
    user_op2 = 48
    va_arg = 49
    extract_element = 50
    insert_element = 51
    shuffle_vector = 52
    extract_value = 53
    insert_value = 54
    fence = 55
    atomic_cmp_xchg = 56
    atomic_rmw = 57
    resume = 58
    landing_pad = 59
end


baremodule LinkageEnum 
    # Externally visible function
    external = 0  
    available_externally = 1 
    # Keep one copy of function when linking (inline)
    link_once_any = 2 
    # Same, but only replaced by something equivalent.
    link_once_odr = 3 
    link_once_odr_auto_hide = 4
    # Keep one copy of function when linking (weak)
    weak_any = 5
    # Same, but only replaced by something equivalent.
    weak_odr = 6
    # Special purpose, only applies to global arrays 
    appending = 7
    # Rename collisions when linking (static functions)
    internal = 8
    # Like Internal, but omit from symbol table
    private = 9
    # Function to be imported from DLL
    dll_import = 10
    # Function to be accessible from DLL
    dll_export = 11
    # ExternalWeak linkage description
    external_weak = 12
    ghost = 13
    # Tentative definitions
    common = 14
    # Like Private, but linker removes
    linker_private = 15
    linker_private_weak = 16
end

baremodule VisibilityEnum
    default   = 0  # the GV is visible
    hidden    = 1  # the GV is hidden
    protected = 2  # the GV is protected
end

baremodule CallCovEnum
    c = 0
    fast = 8
    cold = 9
    web_kit_js = 12
    any_reg = 13
    x86_stdcall = 64
    x86_fastcall = 65
end

baremodule IntPredicateEnum
    eq  = 32    # equal
    ne  = 33    # not equal
    ugt = 34    # unsigned greater than 
    uge = 35    # unsigned greater than or equal
    ult = 36    # unsinged less than
    ule = 37    # unsigned less than or equal
    sgt = 38    # signed greater than
    sge = 39    # signed greater than or equal
    slt = 40    # signed less than
    sle = 41    # signed less than or equal
end

baremodule RealPredicateEnum
    predicate_false =  0  # Always false (always folded)
    oeq =  1    # True if ordered and equal
    ogt =  2    # True if ordered and greater than     
    oge =  3    # True if ordered and greater than or equal
    olt =  4    # True if ordered and less than
    ole =  5    # True if ordered and less than or equal
    one =  6    # True if ordered and operands are unequal
    ord =  7    # True if ordered (no nans)
    uno =  8    # True if unordered: isnan(X) | isnan(Y)
    ueq =  9    # True if unordered or equal
    ugt = 10    # True if unordered or greater than
    uge = 11    # True if unordered, greater than, or equal
    ult = 12    # True if unordered or less than
    ule = 13    # True if unordered, less than, or equal
    une = 14    # True if unordered or not equal
    predicate_true = 15 # Always true (never folded)
end

baremodule LandingPadClauseTyEnum
    catch_  = 0
    filter = 1
end

baremodule ThreadLocalModeEnum
    not_thread_local = 0
    general_dynamic_tls_mode = 1
    local_dynamic_tls_mode =  2
    initial_exec_tls_model = 3
    local_exec_tls_model = 4
end

baremodule AtomicOrderingEnum

    # load or store which is not atomic
    not_atomic = 0

    # lowest level of atomicity, guarantees somewhat sane results, lock free 
    unordered = 1

    # guarantees that if you take all the operations affecting a specific addr
    # a constant ordering exists
    monotonic = 2       
    
    # acquire provides a barrier of the sort necessary to acquire a lock to
    # access other memory
    acquire = 4 

    # release is similar to acquire, but with a barrier of the sort necessary to
    # release a lock
    release = 5 

    #TODO:
    acquire_release = 6
end

baremodule AtomicRMWBinOpEnum
    xchg  = 0   # set the new value and return the old one
    add   = 1   # add a value and return the old one
    sub   = 2   # subtract a value and return the old one
    and   = 3   # and a value and return the old one
    nand  = 4   # not-and a value and return the old one
    or    = 5   # or a value and return the old one
    xor   = 6   # xor a value and return the old one
    max   = 7   # sets the value if its greater than the original using a signed comparison
    min   = 8   # sets the value if its less than the original using a signed comparison
    u_max = 9   # sets the value if its greater than the original using a unsigned comparison 
    u_min = 10  # sets the value if its less than the original using a unsigned comparison
end

abstract FastMathFlags 
let 
    enum  = :(baremodule FastMathFlagsEnum 
                import Base.int32
              end)
    block = enum.args[end].args
    for (n, ty) in enumerate([:UnsafeAlgebra, 
                              :NoNaNs,
                              :NoInfs, 
                              :NoSignedZeros,
                              :AllowReciprocal])
        bitpattern = int32(1) << int32(n - 1)
        push!(block, :($ty = int32($bitpattern))) 
        @eval begin 
            immutable $ty <: FastMathFlags
            end
            ast_to_llvm(n::$ty) = int32($bitpattern)  
        end
    end
    @eval $enum
end

abstract CallConv
let
    enum = :(baremodule CallConvEnum
                import Base.int32
             end)
    block = enum.args[end].args
    for (n, cc) in enumerate([(:CCall,0),
                              (:FastCall,8),
                              (:ColdCall,9)])
        ty, val = cc
        push!(block, :($ty = int32($val))) 
        @eval begin 
            immutable $ty <: CallConv
            end
            ast_to_llvm(n::$ty) = int32($val) 
        end
    end
    @eval $enum
end

baremodule ValueSubclassIDEnum
    import Base.int32

    Argument = int32(0)
    BasicBlock = int32(1)
    Function = int32(2)
    GlobalAlias = int32(3)
    GlobalVariable = int32(4)
    UndefValue = int32(5)
    BlockAddress = int32(6)
    ConstantExpr = int32(7)
    ConstantAggregateZero = int32(8)
    ConstantDataArray = int32(9)
    ConstantDataVector = int32(10)
    ConstantInt = int32(11)
    ConstantFP = int32(12)
    ConstantArray = int32(13)
    ConstantStruct = int32(14)
    ConstantVector = int32(15)
    ConstantPointerNull = int32(16)
    MDNode = int32(17)
    MDString = int32(18)
    InlineAsm = int32(19)
    PseudoSourceValue = int32(20)
    FixedStackPseudoSourceValue = int32(21)
    Instruction = int32(22)
end

baremodule DiagnosticKindEnum
    import Base.int32

    Error   = int32(0)
    Warning = int32(1)
    Note    = int32(2)
end

function llvm_enum(abstyp::DataType, types::Vector{Symbol})
    @assert abstyp.abstract
    enum_name = string(abstyp, "Enum")
    abst_name = string(abstyp)
    return :(
    let
        block = Expr(:block, Expr(:import, :Base, :int32)) 
        enum  = Expr(:module, false, symbol($enum_name), block) 
        for (n, ty) in enumerate($types)
            val = int32(n-1) 
            push!(block.args, Expr(:(=), ty, Expr(:call, :int32, val))) 
            eval(Expr(:type, false, Expr(:(<:), ty, symbol($abst_name)), Expr(:block)))
            eval(Expr(:(=), Expr(:call, :ast_to_llvm, Expr(:(::), :n, ty)),
                            Expr(:call, :int32, val)))
        end
        eval(enum)
    end)
end

abstract AtomicOrdering
eval(llvm_enum(AtomicOrdering, [:NotAtomic, 
                                :Unordered,
                                :Monotonic,
                                :Acquire,
                                :Release,
                                :AcquireRelease,
                                :SequentiallyConsistent]))
abstract LinkageType
eval(llvm_enum(LinkageType, [:ExternalLinkage,
                             :AvailableExternallyLinkage,
                             :LinkOnceAnyLinkage,
                             :LinkOnceODRLinkage,
                             :LinkOnceODRAutoHideLinkage,
                             :WeakAnyLinkage,
                             :WeakODRLinkage,
                             :AppendingLinkage,
                             :InternalLinkage,
                             :PrivateLinkage,
                             :LinkerPrivateLinkage,
                             :LinkerPrivateWeakLinkage,
                             :DLLImportLinkage,
                             :DLLExportLinkage,
                             :ExternalWeakLinkage,
                             :CommonLinkage]))
abstract VisibilityType
eval(llvm_enum(VisibilityType, [:DefaultVisibility,
                                :HiddenVisibility,
                                :ProtectedVisibility]))

abstract AsmDialect
llvm_enum(AsmDialect, [:ATTDialect, :IntelDialect])

abstract AtomicRMWOp
eval(llvm_enum(AtomicRMWOp, [:Xchg, :Add, :Sub, :And,
                             :Nand, :Or, :Xor, :Max, :Min,
                             :UMax, :UMin]))
abstract RelocModel
eval(llvm_enum(RelocModel, [:RelocDefault,
                            :RelocStatic,
                            :RelocPIC,
                            :RelocDynamicNoPIC]))
abstract CodeModel
eval(llvm_enum(CodeModel, [:CodeModelDefault,
                           :CodeModelJITDefault,
                           :CodeModelSmall,
                           :CodeModelKernel,
                           :CodeModelMedium,
                           :CodeModelLarge]))
abstract CodeGenOptLevel
eval(llvm_enum(CodeGenOptLevel, [:CodeGenOptLevelNone,
                                 :CodeGenOptLevelLess,
                                 :CodeGenOptLevelDefault,
                                 :CodeGenOptLevelAggressive]))
abstract CodeGenFileType
eval(llvm_enum(CodeGenFileType, [:CodeGenAssemblyFile, 
                                 :CodeGenObjectFile]))
