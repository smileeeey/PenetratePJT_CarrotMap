# CarrotMap 프로젝트

```
package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.StringTokenizer;

public class Solution {
	
	
	
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int T = Integer.parseInt(br.readLine());
		
		for (int t = 1; t <= T; t++) {
			List<int[]> MPos = new ArrayList<>();
			List<int[]> EPos = new ArrayList<>();
			int answer = 0;
			
			int N = Integer.parseInt(br.readLine());
			for (int i = 0; i < N; i++) {
				StringTokenizer st = new StringTokenizer(br.readLine()," ");
				for (int j = 0; j < N; j++) {
					int cur = Integer.parseInt(st.nextToken());
					
					if(cur == 0)	continue;
					if(cur == 1) {
						MPos.add(new int[] {i,j});
						continue;
					}
					EPos.add(new int[] {i,j});
				}
			}
			
			int ESIZE = EPos.size();
			int MSIZE = MPos.size();
			
			//사람마다 각 비상구까지 걸리는 이동시간 찾기
			int[][] moveArr = new int[MSIZE][ESIZE];
			
			for (int i = 0; i < MSIZE; i++) {
				int[] M = MPos.get(i);
				for (int j = 0; j < ESIZE; j++) {
					int[] E = EPos.get(j);
					moveArr[i][j] = Math.abs(M[0]-E[0])+Math.abs(M[1]-E[1]);
				}
			}
			
			//비상구마다 큐 크기
			int[] EWaitSize = new int[ESIZE];
			
			//int[] : 사람번호, 탈출가능시간, 탈출구번호
			Queue<int[]> waitQueue = new LinkedList<>();
			
			//사람별 탈출 여부 0:이동중, 1:큐에서 대기중, 2:탈출 
			int[] exitPeople = new int[ESIZE];
			
			while(true) {
				
				//큐 돌면서 현재 시간에 탈출 가능한 사람 큐에서 제거
				int size = waitQueue.size();
				for (int i = 0; i < size; i++) {
					int[] cur = waitQueue.peek();
					
					if(cur[1] == answer) {
						waitQueue.poll();
						if(exitPeople[cur[0]]==2)	continue;
						exitPeople[cur[0]] = 2;
						EWaitSize[cur[2]]--;
					}
					else	break;
				}
				
				//모든 사람이 탈출했다면 while루프 탈출
				int cnt = 0;
				for (int i = 0; i < exitPeople.length; i++) {
					if(exitPeople[i] == 2)	cnt++;
				}
				if(cnt==ESIZE)	break;
				
				//큐에 넣기
				for (int i = 0; i < exitPeople.length; i++) {
					//큐에 이미 들어가거나 탈출한 사람은 pass
					if(exitPeople[i]>=1)	continue;
					
					//이동중인 사람 : i
					int min = Integer.MAX_VALUE;
					//이 사람은 minIdx의 탈출구로 빠져나가!
					int minIdx= -1;
					
					//비상구 돌면서 현재 상태에서 빠져나갈 수 있으면 큐에 계산해서 넣기
					for (int j = 0; j < ESIZE; j++) {
						if(moveArr[i][j] != answer)	continue;
						////이부분부터 고민 시작임...
						int cur = moveArr[i][j]+EWaitSize[j];
						if(min>cur) {
							min = cur;
							minIdx = j;
						}
					}
					
					if(minIdx==-1)	continue;
					
					
					
				}
				
				++answer;
			}
			
			System.out.println("#"+t+" "+answer);
		}
	}
}
```
