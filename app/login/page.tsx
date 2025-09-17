"use client"

import { useFormStatus } from "react-dom"
import { useSearchParams } from "next/navigation"
import { login } from "@/lib/auth.actions"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

function SubmitButton() {
  const { pending } = useFormStatus()
  return (
    <Button type="submit" className="w-full bg-blue-600 hover:bg-blue-700 text-white" disabled={pending}>
      {pending ? "Logging in..." : "Login"}
    </Button>
  )
}

export default function LoginPage() {
  const searchParams = useSearchParams()
  const error = searchParams.get("error")

  return (
    <main className="flex items-center justify-center h-screen bg-blue-50">
      <Card className="w-full max-w-sm border-blue-200 shadow-lg">
        <CardHeader className="text-center">
          <CardTitle className="text-2xl text-blue-800">Student Login</CardTitle>
          <CardDescription className="text-blue-600">Please enter your Student ID and name to continue.</CardDescription>
        </CardHeader>
        <CardContent>
          <form action={login} className="space-y-4">
            <div className="space-y-2">
              <Label htmlFor="studentId" className="text-blue-700 font-medium">Student ID</Label>
              <Input 
                id="studentId" 
                name="studentId" 
                type="number" 
                placeholder="e.g., 30xxxxx" 
                required 
                className="border-blue-300 focus:border-blue-500 focus:ring-blue-500"
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="name" className="text-blue-700 font-medium">Name</Label>
              <Input 
                id="name" 
                name="name" 
                type="text" 
                placeholder="e.g., Aytuna" 
                required 
                className="border-blue-300 focus:border-blue-500 focus:ring-blue-500"
              />
            </div>
            {error && <p className="text-sm text-red-500">{error}</p>}
            <SubmitButton />
          </form>
        </CardContent>
      </Card>
    </main>
  )
}
