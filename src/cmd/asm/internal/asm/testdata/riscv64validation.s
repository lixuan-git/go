// Copyright 2024 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This file is for validation errors only, i.e., errors reported by the validate function.
// Negative test cases for errors generated earlier in the assembler's preprocess stage
// should be added to riscv64error.s.  If they are added to this file, they will prevent
// the validate function from being run and TestRISCVValidation will report missing
// errors.

TEXT validation(SB),$0
	SRLI	$1, X5, F1			// ERROR "expected integer register in rd position but got non-integer register F1"
	SRLI	$1, F1, X5			// ERROR "expected integer register in rs1 position but got non-integer register F1"

	//
	// "V" Standard Extension for Vector Operations, Version 1.0
	//
	VSETVLI		$32, E16, M1, TU, MU, X12	// ERROR "must be in range [0, 31] (5 bits)"
	VSETVLI		$-1, E32, M2, TA, MA, X12	// ERROR "must be in range [0, 31] (5 bits)"
	VSETVL		X10, X11			// ERROR "expected integer register in rs1 position"
	VLE8V		(X10), X10			// ERROR "expected vector register in vd position"
	VLE8V		(V1), V3			// ERROR "expected integer register in rs1 position"
	VSE8V		X10, (X10)			// ERROR "expected vector register in vs1 position"
	VSE8V		V3, (V1)			// ERROR "expected integer register in rd position"
	VLSE8V		(X10), V3			// ERROR "expected integer register in rs2 position"
	VLSE8V		(X10), X10, X11			// ERROR "expected vector register in vd position"
	VLSE8V		(V1), X10, V3			// ERROR "expected integer register in rs1 position"
	VLSE8V		(X10), V1, V0, V3		// ERROR "expected integer register in rs2 position"
	VSSE8V		V3, (X10)			// ERROR "expected integer register in rs2 position"
	VSSE8V		X10, X11, (X10)			// ERROR "expected vector register in vd position"
	VSSE8V		V3, X11, (V1)			// ERROR "expected integer register in rs1 position"
	VSSE8V		V3, V1, V0, (X10)		// ERROR "expected integer register in rs2 position"
	VLUXEI8V	(X10), V2, X11			// ERROR "expected vector register in vd position"
	VLUXEI8V	(X10), V2, X11			// ERROR "expected vector register in vd position"
	VLUXEI8V	(V1), V2, V3			// ERROR "expected integer register in rs1 position"
	VLUXEI8V	(X10), X11, V0, V3		// ERROR "expected vector register in vs2 position"
	VSUXEI8V	X10, V2, (X10)			// ERROR "expected vector register in vd position"
	VSUXEI8V	V3, V2, (V1)			// ERROR "expected integer register in rs1 position"
	VSUXEI8V	V3, X11, V0, (X10)		// ERROR "expected vector register in vs2 position"
	VLOXEI8V	(X10), V2, X11			// ERROR "expected vector register in vd position"
	VLOXEI8V	(V1), V2, V3			// ERROR "expected integer register in rs1 position"
	VLOXEI8V	(X10), X11, V0, V3		// ERROR "expected vector register in vs2 position"
	VSOXEI8V	X10, V2, (X10)			// ERROR "expected vector register in vd position"
	VSOXEI8V	V3, V2, (V1)			// ERROR "expected integer register in rs1 position"
	VSOXEI8V	V3, X11, V0, (X10)		// ERROR "expected vector register in vs2 position"
	VL1RV		(X10), X10			// ERROR "expected vector register in vd position"
	VL1RV		(V1), V3			// ERROR "expected integer register in rs1 position"
	VS1RV		X11, (X11)			// ERROR "expected vector register in vs1 position"
	VS1RV		V3, (V1)			// ERROR "expected integer register in rd position"
	VADDVV		V1, X10, V3			// ERROR "expected vector register in vs2 position"
	VADDVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VADDVI		$16, V4, V2			// ERROR "signed immediate 16 must be in range [-16, 15] (5 bits)"
	VADDVI		$-17, V4, V2			// ERROR "signed immediate -17 must be in range [-16, 15] (5 bits)"
	VSUBVV		V1, X10, V3			// ERROR "expected vector register in vs2 position"
	VSUBVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VRSUBVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VRSUBVI		$16, V4, V2			// ERROR "signed immediate 16 must be in range [-16, 15] (5 bits)"
	VRSUBVI		$-17, V4, V2			// ERROR "signed immediate -17 must be in range [-16, 15] (5 bits)"
	VNEGV		X10, V3				// ERROR "expected vector register in vs2 position"
	VNEGV		V2				// ERROR "expected vector register in vd position"
	VWADDUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWADDUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWSUBUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWSUBUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWADDVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWADDVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWSUBVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWSUBVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWADDUWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWADDUWX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWSUBUWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWSUBUWX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWADDWV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWADDWX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWSUBWV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWSUBWX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWCVTXXV	X10, V3				// ERROR "expected vector register in vs2 position"
	VWCVTUXXV	X10, V3				// ERROR "expected vector register in vs2 position"
	VZEXTVF2	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VZEXTVF2	X10, V3				// ERROR "expected vector register in vs2 position"
	VSEXTVF2	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VSEXTVF2	X10, V3				// ERROR "expected vector register in vs2 position"
	VZEXTVF4	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VZEXTVF4	X10, V3				// ERROR "expected vector register in vs2 position"
	VSEXTVF4	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VSEXTVF4	X10, V3				// ERROR "expected vector register in vs2 position"
	VZEXTVF8	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VZEXTVF8	X10, V3				// ERROR "expected vector register in vs2 position"
	VSEXTVF8	V2, V0, V3, V4			// ERROR "expected no register in rs3"
	VSEXTVF8	X10, V3				// ERROR "expected vector register in vs2 position"
	VADCVVM		X10, V2, V0, V3			// ERROR "expected vector register in vs1 position"
	VADCVXM		V1, V2, V0, V3			// ERROR "expected integer register in rs1 position"
	VADCVIM		$16, V2, V0, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VADCVIM		$-17, V2, V0, V3		// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMADCVVM	X10, V2, V0, V3			// ERROR "expected vector register in vs1 position"
	VMADCVXM	V1, V2, V0, V3			// ERROR "expected integer register in rs1 position"
	VMADCVIM	$16, V2, V0, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMADCVIM	$-17, V2, V0, V3		// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMADCVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMADCVV		V1, V2, V0, V3			// ERROR "expected no register in rs3"
	VMADCVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMADCVX		X10, V2, V0, V3			// ERROR "expected no register in rs3"
	VMADCVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMADCVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMADCVI		$15, V2, V0, V3			// ERROR "expected no register in rs3"
	VSBCVVM		X10, V2, V0, V3			// ERROR "expected vector register in vs1 position"
	VSBCVXM		V1, V2, V0, V3			// ERROR "expected integer register in rs1 position"
	VMSBCVVM	X10, V2, V0, V3			// ERROR "expected vector register in vs1 position"
	VMSBCVXM	V1, V2, V0, V3			// ERROR "expected integer register in rs1 position"
	VMSBCVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSBCVV		V1, V2, V0, V3			// ERROR "expected no register in rs3"
	VMSBCVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSBCVX		X10, V2, V0, V3			// ERROR "expected no register in rs3"
	VANDVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VANDVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VANDVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VANDVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VORVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VORVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VORVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VORVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VXORVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VXORVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VXORVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VXORVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VNOTV		V3				// ERROR "expected vector register in vd position"
	VNOTV		X10, V3				// ERROR "expected vector register in vs2 position"
	VSLLVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSLLVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSLLVI		$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VSLLVI		$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VSRLVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSRLVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSRLVI		$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VSRLVI		$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VSRAVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSRAVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSRAVI		$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VSRAVI		$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VNSRLWV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VNSRLWX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNSRLWI		$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VNSRLWI		$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VNSRAWV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VNSRAWX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNSRAWI		$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VNSRAWI		$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VNCVTXXW	X10, V3				// ERROR "expected vector register in vs2 position"
	VMSEQVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSEQVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSEQVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSEQVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSNEVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSNEVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSNEVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSNEVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSLTUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSLTUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSLTVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSLTVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSLEUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSLEUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSLEUVI	$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSLEUVI	$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSLEVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMSLEVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSLEVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSLEVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSGTUVV	X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VMSGTUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSGTUVI	$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSGTUVI	$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSGTVV		X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VMSGTVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMSGTVI		$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSGTVI		$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSGEVV		X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VMSGEUVV	X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VMSLTVI		$17, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSLTVI		$-16, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSLTUVI	$17, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSLTUVI	$-16, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSGEVI		$17, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSGEVI		$-16, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMSGEUVI	$17, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMSGEUVI	$-16, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMINUVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMINUVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMINVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMINVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMAXUVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMAXUVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMAXVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMAXVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMULVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMULVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMULHVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMULHVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMULHUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMULHUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMULHSUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMULHSUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VDIVUVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VDIVUVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VDIVVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VDIVVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VREMUVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREMUVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VREMVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREMVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMULVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWMULVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMULUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWMULUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMULSUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWMULSUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMACCVV		V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VMACCVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNMSACVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VNMSACVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMADDVV		V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VMADDVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNMSUBVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VNMSUBVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMACCUVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VWMACCUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMACCVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VWMACCVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMACCSUVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VWMACCSUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VWMACCUSVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VMERGEVVM	X10, V2, V0, V3			// ERROR "expected vector register in vs1 position"
	VMERGEVXM	V1, V2, V0, V3			// ERROR "expected integer register in rs1 position"
	VMERGEVIM	$16, V2, V0, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMERGEVIM	$-17, V2, V0, V3		// ERROR "signed immediate -17 must be in range [-16, 15]"
	VMVVV		X10, V3				// ERROR "expected vector register in vs1 position"
	VMVVX		V1, V2				// ERROR "expected integer register in rs1 position"
	VMVVI		$16, V2				// ERROR "signed immediate 16 must be in range [-16, 15]"
	VMVVI		$-17, V2			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VSADDUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSADDUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSADDUVI	$16, V2, V3			// ERROR "signed immediate 16 must be in range [-16, 15]"
	VSADDUVI	$-17, V2, V3			// ERROR "signed immediate -17 must be in range [-16, 15]"
	VSSUBUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSSUBUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VAADDUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VAADDUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VAADDVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VAADDVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VASUBUVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VASUBUVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VASUBVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VASUBVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSMULVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSMULVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSSRLVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSSRLVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSSRLVI		$32, V2, V3			// ERROR "signed immediate 32 must be in range [0, 31]"
	VSSRLVI		$-1, V2, V3			// ERROR "signed immediate -1 must be in range [0, 31]"
	VSSRAVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VSSRAVX		V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSSRAVI		$32, V2, V3			// ERROR "signed immediate 32 must be in range [0, 31]"
	VSSRAVI		$-1, V2, V3			// ERROR "signed immediate -1 must be in range [0, 31]"
	VNCLIPUWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VNCLIPUWX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNCLIPUWI	$32, V2, V3			// ERROR "signed immediate 32 must be in range [0, 31]"
	VNCLIPUWI	$-1, V2, V3			// ERROR "signed immediate -1 must be in range [0, 31]"
	VNCLIPWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VNCLIPWX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VNCLIPWI	$32, V2, V3			// ERROR "signed immediate 32 must be in range [0, 31]"
	VNCLIPWI	$-1, V2, V3			// ERROR "signed immediate -1 must be in range [0, 31]"
	VFADDVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFADDVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFSUBVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFSUBVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFRSUBVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFWADDVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWADDVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFWSUBVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWSUBVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFWADDWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWADDWF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFWSUBWV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWSUBWF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFMULVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFMULVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFDIVVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFDIVVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFRDIVVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFWMULVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWMULVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFMACCVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFMACCVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFNMACCVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFNMACCVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFMSACVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFMSACVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFNMSACVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFNMSACVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFMADDVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFMADDVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFNMADDVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFNMADDVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFMSUBVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFMSUBVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFNMSUBVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFNMSUBVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFWMACCVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFWMACCVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFWNMACCVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFWNMACCVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFWMSACVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFWMSACVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFWNMSACVV	V2, X10, V3			// ERROR "expected vector register in vs1 position"
	VFWNMSACVF	V2, X10, V3			// ERROR "expected float register in rs1 position"
	VFSQRTV		X10, V3				// ERROR "expected vector register in vs2 position"
	VFRSQRT7V	X10, V3				// ERROR "expected vector register in vs2 position"
	VFREC7V		X10, V3				// ERROR "expected vector register in vs2 position"
	VFMINVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFMINVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFMAXVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFMAXVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFSGNJVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFSGNJVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFSGNJNVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFSGNJNVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFSGNJXVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFSGNJXVF	X10, V2, V3			// ERROR "expected float register in rs1 position"
	VFNEGV		V2, X10				// ERROR "expected vector register in vd position"
	VFABSV		V2, X10				// ERROR "expected vector register in vd position"
	VMFEQVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMFEQVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFNEVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMFNEVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFLTVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMFLTVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFLEVV		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMFLEVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFGTVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFGEVF		X10, V2, V3			// ERROR "expected float register in rs1 position"
	VMFGTVV		X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VMFGEVV		X10, V2, V3			// ERROR "expected vector register in vs2 position"
	VFCLASSV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFMERGEVFM	X10, V2, V0, V3			// ERROR "expected float register in rs1 position"
	VFMVVF		X10, V3				// ERROR "expected float register in rs1 position"
	VFCVTXUFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFCVTXFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFCVTRTZXUFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFCVTRTZXFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFCVTFXUV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFCVTFXV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTXUFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTXFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTRTZXUFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTRTZXFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTFXUV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTFXV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFWCVTFFV	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTXUFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTXFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTRTZXUFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTRTZXFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTFXUW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTFXW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTFFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VFNCVTRODFFW	X10, V3				// ERROR "expected vector register in vs2 position"
	VREDSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDMAXUVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDMAXVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDMINUVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDMINVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDANDVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDORVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VREDXORVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWREDSUMUVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VWREDSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFREDOSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFREDUSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFREDMAXVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFREDMINVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWREDOSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VFWREDUSUMVS	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMANDMM		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMNANDMM	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMANDNMM	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMXORMM		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMORMM		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMNORMM		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMORNMM		X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMXNORMM	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMMVM		V3, X10				// ERROR "expected vector register in vd position"
	VMNOTM		V3, X10				// ERROR "expected vector register in vd position"
	VCPOPM		V2, V1				// ERROR "expected integer register in rd position"
	VCPOPM		X11, X10			// ERROR "expected vector register in vs2 position"
	VFIRSTM		V2, V1				// ERROR "expected integer register in rd position"
	VFIRSTM		X11, X10			// ERROR "expected vector register in vs2 position"
	VMSBFM		X10, V3				// ERROR "expected vector register in vs2 position"
	VMSIFM		X10, V3				// ERROR "expected vector register in vs2 position"
	VMSOFM		X10, V3				// ERROR "expected vector register in vs2 position"
	VIOTAM		X10, V3				// ERROR "expected vector register in vs2 position"
	VIDV		X10				// ERROR "expected vector register in vd position"
	VMVXS		X11, X10			// ERROR "expected vector register in vs2 position"
	VMVXS		V2, V1				// ERROR "expected integer register in rd position"
	VMVSX		X11, X10			// ERROR "expected vector register in vd position"
	VMVSX		V2, V1				// ERROR "expected integer register in rs2 position"
	VFMVFS		X10, F10			// ERROR "expected vector register in vs2 position"
	VFMVFS		V2, V1				// ERROR "expected float register in rd position"
	VFMVSF		X10, V2				// ERROR "expected float register in rs2 position"
	VFMVSF		V2, V1				// ERROR "expected float register in rs2 position"
	VSLIDEUPVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSLIDEUPVI	$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VSLIDEUPVI	$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VSLIDEDOWNVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VSLIDEDOWNVI	$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VSLIDEDOWNVI	$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VSLIDE1UPVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VFSLIDE1UPVF	V1, V2, V3			// ERROR "expected float register in rs1 position"
	VSLIDE1DOWNVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VFSLIDE1DOWNVF	V1, V2, V3			// ERROR "expected float register in rs1 position"
	VRGATHERVV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VRGATHEREI16VV	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VRGATHERVX	V1, V2, V3			// ERROR "expected integer register in rs1 position"
	VRGATHERVI	$-1, V2, V3			// ERROR "unsigned immediate -1 must be in range [0, 31]"
	VRGATHERVI	$32, V2, V3			// ERROR "unsigned immediate 32 must be in range [0, 31]"
	VCOMPRESSVM	X10, V2, V3			// ERROR "expected vector register in vs1 position"
	VMV1RV		X10, V1				// ERROR "expected vector register in vs2 position"
	VMV2RV		X10, V10			// ERROR "expected vector register in vs2 position"
	VMV4RV		X10, V4				// ERROR "expected vector register in vs2 position"
	VMV8RV		X10, V0				// ERROR "expected vector register in vs2 position"

	RET
