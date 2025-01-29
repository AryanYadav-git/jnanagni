import { db } from "@/lib/db";
import { hash } from "bcrypt";
import { NextResponse } from "next/server";

export async function POST(req: Request) {
  try {
    const body = await req.json();
    const { email, username, password, name } = body;

    const existingUser = await db.user.findUnique({
      where: { email },
    });

    if (existingUser) {
      return NextResponse.json(
        { user: null, message: "User already exists" },
        { status: 409 }
      );
    }
    const hashedpassword = await hash(password, 10);
    const newUser = await db.user.create({
      data: {
        name,
        email,
        username,
        password: hashedpassword
      },
    });

    const { password: newUserPassword, ...rest} = newUser;

    return NextResponse.json({
      user: rest,
      message: "User created",
    });
  } catch (error: unknown) {
    if (error instanceof Error) {
      console.error("Error creating user:", error.message); 
      return NextResponse.json(
        { message: "Internal Server Error", error: error.message },
        { status: 500 }
      );
    } else {
      console.error("Unexpected error:", error);
      return NextResponse.json(
        { message: "Internal Server Error", error: "Unknown error occurred" },
        { status: 500 }
      );
    }
  }
}
